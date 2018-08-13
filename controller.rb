require ('sinatra')
require ('sinatra/contrib/all') if development?
require ('pry-byebug')

require_relative ('models/plants.rb')
require_relative ('models/species.rb')
require_relative ('./species_controller.rb')

also_reload ('models/*')

#INDEX
get '/plant-shop/plants' do
  @plants = Plant.all()
  erb (:plant_index)
end

#NEW
get '/plant-shop/plants/new' do
  @species = Species.all()
  erb (:new)
end

#CREATE
post '/plant-shop/plants' do
  @plant = Plant.new(params)
  @plant.save()
  erb (:create)
end

#SHOW
get '/plant-shop/plants/:id' do
  @plant = Plant.find(params[:id])
  erb (:show)
end
