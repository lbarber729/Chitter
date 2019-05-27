require 'sinatra/base'
require './lib/peep.rb'

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
end
