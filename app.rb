# base_url = "https://sofifa.com/players?keyword="
require "sinatra"
require "sinatra/reloader" if development?
require "pry-byebug"
require "better_errors"

require_relative "config/application"

configure :development do
  use BetterErrors::Middleware
  BetterErrors.application_root = File.expand_path(__dir__)
end

enable :sessions

set :views, (proc { File.join(root, "app/views") })
set :bind, '0.0.0.0'

get '/' do
  erb :login
end

get '/signup' do
  erb :create_account
end

post '/create_user' do
  if User.find_by(email: params["email"]).nil?
    @user = User.new(email: params["email"], password: params["password"], first_name: params["first_name"], last_name: params["last_name"], username: params["first_name"])
    binding.pry
    if @user.valid?
      @user.save
      session[:user] = @user
      erb :player_lists
    else
      # FLASH ERROR - need details
      erb :create_account
    end
  else
    # FLASH ERROR - user already exists
    erb :create_account
  end
end

get '/login' do
  erb :login
end

post '/player_lists' do
  @user = User.find_by(email: params["email"])
  unless @user.nil?
    session[:user] = @user if @user.password == params["password"]
    erb :player_lists
  else
    # FLASH ERROR - wrong details
    redirect '/login'
  end
end

get '/create_player_list' do
  erb :create_player_list
end

get '/player_list/:id' do
  @player_list = PlayerList.find(params["id"])
  erb :player_list
end
