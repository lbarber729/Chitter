require 'sinatra/base'
require './lib/peep.rb'
require './lib/users.rb'

class Chitter < Sinatra::Base
  get '/' do
    @peeps = Peep.all
    erb :peeps
  end

  post '/add_peep' do
    @peep = params[:peep]
    @time = Time.now.strftime('%d/%m/%Y, %k:%M')
    Peep.post(peep: @peep, posted_at: @time)
    redirect '/'
  end

  get '/sign_up' do
    erb :sign_up
  end

  post '/sign_up' do
    @name = params[:name]
    @username = params[:username]
    @email = params[:email]
    @password = params[:password]
    User.create(name: @name, username: @username, email: @email, password: @password)
    redirect '/'
  end

end
