require_relative "config/application"
require "sinatra"
require "sinatra/reloader"
require "sinatra/activerecord"
require "pry"

get "/" do
  @restaurants = Restaurant.all
  erb :index
end

get "/restaurants/:id" do
  @restaurant = Restaurant.find(params[:id])
  erb :show
end

post "/restaurants" do
  binding.pry
  restaurant = Restaurant.create(name: params[:name], address: params[:address])
  redirect "/#{restaurant.id}"
end

get "/vote/:id" do
  restaurant = Restaurant.find(params[:id])
  restaurant.rating += 1
  restaurant.save
  redirect "/restaurants/#{restaurant.id}"
end

delete "/restaurants/:id" do
  restaurant = Restaurant.find(params[:id])
  restaurant.destroy
  redirect "/"
end
