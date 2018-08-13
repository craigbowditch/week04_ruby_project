require ('sinatra')
require ('sinatra/contrib/all') if development?
require ('pry-byebug')

require_relative ('../models/plants.rb')
require_relative ('../models/species.rb')
require_relative ('./species_controller.rb')

also_reload ('../models/*')

#INDEX
get '/plant-shop/plants' do
  @plants = Plant.all()
  erb (:"plants/index")
end

#NEW
get '/plant-shop/plants/new' do
  @species = Species.all()
  erb (:"plants/new")
end

#CREATE
post '/plant-shop/plants' do
  @plant = Plant.new(params)
  @plant.save()
  erb (:"plants/create")
end

#SHOW
get '/plant-shop/plants/:id' do
  @plant = Plant.find(params[:id])
  erb (:"plants/show")
end

#DELETE
post '/plant-shop/plants/:id/delete' do
  @plant = Plant.find(params[:id])
  @plant.delete_one()
  redirect "http://localhost:4567/plant-shop/plants"
end

#EDIT
get '/plant-shop/plants/:id/edit' do
  @plant = Plant.find(params[:id])
  @species = Species.all()
  erb (:"plants/edit")
end

#UPDATE
post '/plant-shop/plants/:id/update' do
  @plant = Plant.new(params)
  @plant.update()
  redirect "http://localhost:4567/plant-shop/plants"
end
