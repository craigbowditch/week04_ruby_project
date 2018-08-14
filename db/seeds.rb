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
    "description" => "Maranta is a genus of flowering plants in the family Marantaceae, native to tropical Central and South America and the West Indies.",
    "image" => "/images/Maranta.jpg"
    })
    maranta.save()

fern = Species.new(
  {
    "name" => "Polypodiopsida",
    "common_name" => "Fern",
    "description" => "A fern is a member of a group of vascular plants (plants with xylem and phloem) that reproduce via spores and have neither seeds nor flowers.",
    "image" => "/images/fern.jpg"
    })
    fern.save()

plant1 = Plant.new(
  {
    "name" => "Red Prayer Plant",
    "latin_name" => "Maranta leuconeura var. erythroneura",
    "description" => "Red prayer plant shows off dark green leaves, purple markings, and rich red veins.",
    "stock_quantity" => 4,
    "buying_cost" => 5,
    "selling_price" => 10,
    "species_id" => maranta.id,
    "image" => "/images/red_prayer_plant.png"
    })
    plant1.save

  plant2 = Plant.new(
    {
      "name" => "Marisela Prayer Plant",
      "latin_name" => "Maranta leuconeura 'Marisela'",
      "description" => "Marisela prayer plant is a hardy indoor plant with dark green leaves and lighter green markings between the veins.",
      "stock_quantity" => 1,
      "buying_cost" => 6,
      "selling_price" => 12,
      "species_id" => maranta.id,
      "image" => "/images/marisela_prayer_plant.jpg"
      })
      plant2.save

      plant3 = Plant.new(
        {
          "name" => "Blue Star Fern",
          "latin_name" => "Phlebodium aureum",
          "description" => "Blue star fern is an easy houseplant that does well in the lower light conditions found in most interiors. It enjoys moist soil, so it’s hard to overwater this fern. Its scrappy leaves and dusky green color make it an interesting addition to the room.",
          "stock_quantity" => 0,
          "buying_cost" => 4,
          "selling_price" => 10,
          "species_id" => fern.id,
          "image" => "/images/blue_star_fern.jpg"
          })
          plant3.save


    binding.pry
    nil
