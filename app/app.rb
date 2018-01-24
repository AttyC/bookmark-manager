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
    erb :link
  end

  get '/links/new' do
    erb :new
  end

  get '/tags/:name' do
    tag = Tag.first(:name => params[:name])
    @filtered_links = tag ? tag.links : []
    erb :filter_tag
  end

  post '/links' do
    link = Link.create(title: params["title"], url: params["url"])
    tag = Tag.create(name: params["tag_name"])
    LinkTag.create(:link => link, :tag => tag)
    redirect '/links/new'
  end
end
