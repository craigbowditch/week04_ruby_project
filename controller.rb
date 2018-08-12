require ('sinatra')
require ('sinatra/contrib/all') if development?
require ('pry-byebug')

require_relative ('models/plants.rb')
require_relative ('models/species.rb')
also_reload ('models/*')

#INDEX
get '/plant-shop/plants' do
  @plants = Plant.all()
  erb (:plant_index)
end

#SHOW
get '/plant-shop/plants/:id' do
  @plant = Plant.find(params[:id])
  erb (:show)
end
