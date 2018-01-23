ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'models/link'

class Bookmarks < Sinatra::Base

  enable :sessions

  get '/' do
    redirect '/links'
  end

  get '/links' do
    @links = Link.all
    p @links
    erb :link
  end

  get '/links/new' do
    erb :new
  end

  post '/links' do
    Link.create(title: params["title"], url: params["url"])
    redirect '/links/new'
  end

  run! if app_file == $0
end
