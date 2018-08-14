require ('sinatra')
require ('sinatra/contrib/all') if development?
require ('pry-byebug')

require_relative ('../models/plants.rb')
require_relative ('../models/species.rb')
require_relative ('./plant_controller.rb')

also_reload ('../models/*')

#INDEX
get '/plant-shop/species' do
  @species = Species.all()
  erb (:"species/index")
end

get '/plant-shop/species/:id/plants' do
  @species = Species.find(params[:id])
  erb (:"species/plants")
end

#NEW
get '/plant-shop/species/new' do
  erb (:"species/new")
end

#CREATE
post '/plant-shop/species' do
  @species = Species.new(params)
  @species.save()
  erb (:"species/create")
end

#SHOW
get '/plant-shop/species/:id' do
  @species = Species.find(params[:id])
  erb (:"species/show")
end

#DELETE
post '/plant-shop/species/:id/delete' do
  @species = Species.find(params[:id])
  @species.delete_one
  redirect "http://localhost:4567/plant-shop/species"
end

#EDIT
get '/plant-shop/species/:id/edit' do
  @species = Species.find(params[:id])
  erb (:"species/edit")
end

#UPDATE
post '/plant-shop/species/:id/update' do
  @species = Species.new(params)
  @species.update()
  redirect "http://localhost:4567/plant-shop/species"
end
