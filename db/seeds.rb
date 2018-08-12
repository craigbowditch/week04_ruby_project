require_relative('sql_runner.rb')
require_relative('../models/species.rb')
require_relative('../models/plants.rb')

require ('pry')

Plant.delete()
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
    "selling_price" => 10,
    "species_id" => maranta.id
    })
    plant1.save

  plant2 = Plant.new(
    {
      "name" => "Marisela Prayer Plant",
      "latin_name" => "Maranta leuconeura 'Marisela'",
      "description" => "Marisela prayer plant is a hardy indoor plant with dark green leaves and lighter green markings between the veins.",
      "stock_quantity" => 3,
      "buying_cost" => 6,
      "selling_price" => 12,
      "species_id" => maranta.id
      })
      plant2.save


    binding.pry
    nil
