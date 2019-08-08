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
  erb :create_account
end

get '/login' do
  erb :login
end

post '/player_lists' do
  @user = User.find_by(email: params["email"])
  if @user.nil?
    @user = User.create(email: params["email"], password: params["password"])
  end
  session[:user] = @user if @user.password == params["password"]
  erb :player_lists
end

get '/create_player_list' do
  erb :create_player_list
end

get '/player_list/:index' do

end
