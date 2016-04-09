require 'sinatra'
require './inventory_file.rb'
require './navigator_file.rb'

set :port, 4567

get '/' do
  "<h1>Kiosk Fresh</h1>"
end

get '/navigator' do
  @navigator = read_navigator
  erb :'navigator/index'
end

get '/navigator/show' do
  @inventory = read_inventory
  erb :'navigator/show'
end

get '/navigator/search' do
  erb :'navigator/search'
end

post '/navigator/results' do
  @inventory = read_inventory.select { |invent| invent[:name] =~ /#{params[:name]}/i }
  erb :'navigator/results'
end

get '/navigator/buy' do
  erb :'navigator/buy'
end
