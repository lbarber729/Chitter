require 'sinatra/base'
require './lib/peep.rb'

class Chitter < Sinatra::Base
  get '/' do
    @peeps = Peep.all
    erb :peeps
  end

  post '/add_peep' do
    @peep = params[:peep]
    Peep.post(@peep)
    redirect '/'
  end
end
