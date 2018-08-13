require ('sinatra')
require ('sinatra/contrib/all') if development?
require ('pry-byebug')

require_relative ('models/plants.rb')
require_relative ('models/species.rb')
require_relative ('./plant_controller.rb')

also_reload ('models/*')

#INDEX
get '/plant-shop/species' do
  @species = Species.all()
  erb (:"species/index")
end
