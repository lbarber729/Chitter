require 'sinatra/base'

class Chitter < Sinatra::Base

 get '/'do
   erb :peeps
 end
end
