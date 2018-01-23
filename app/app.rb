require 'sinatra/base'
require_relative 'models/link'

class Bookmarks < Sinatra::Base

  get '/links' do
    @links = Link.all
    p @links
    erb :link
  end

  run! if app_file == $0
end
