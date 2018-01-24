ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'

require_relative "run_app"


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
    link = Link.create(title: params["title"], url: params["url"])
    tag = Tag.create(name: params["tag_name"])
    LinkTag.create(:link => link, :tag => tag)
    redirect '/links/new'
  end

  run! if app_file == $0
end
