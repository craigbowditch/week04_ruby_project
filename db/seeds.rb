require_relative('sql_runner.rb')
require_relative('../models/species.rb')
require_relative('../models/plants.rb')

require ('pry')

Species.delete()

maranta = Species.new(
  {
    "name" => "Maranta",
    "common_name" => "Prayer Plant",
    "description" => "Maranta is a genus of flowering plants in the family Marantaceae, native to tropical Central and South America and the West Indies."
    })
    maranta.save()

plant1 = Plant.new(
  {
    "name" => "Red Prayer Plant",
    "latin_name" => "Maranta leuconeura var. erythroneura",
    "description" => "Red prayer plant shows off dark green leaves, purple markings, and rich red veins.",
    "stock_quantity" => 4,
    "buying_cost" => 5,
    "selling_price" => 10
    })
    plant1.save


    binding.pry
    nil
