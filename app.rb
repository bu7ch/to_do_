require "sinatra"
require "shotgun"
require "sinatra/activerecord"

set :database, "sqlite3:///foo.sqlite3"

# Definition my Todo class
class Todo < ActiveRecord::Base  
end

get '/' do 
	# Dislay all Todos
	 @t = Todo.all
	erb :index
end


post '/new' do 
	@t = Todo.create(params)
	redirect '/'
end

get '/edit/:id' do 
	@todo = Todo.find params[:id]
	erb :edit
end

post "/edit/:id" do 
	# Tâche à update(:content) params[:id]
	Todo.find(params[:id]).update_attributes :content ,params[:content]
	redirect '/'
end

get '/delete/:id' do
	Todo.destroy params[:id]
	redirect '/'
end