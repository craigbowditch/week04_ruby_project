require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/plant_controller.rb')
require_relative('controllers/species_controller.rb')

get '/' do
  erb( :index )
end
