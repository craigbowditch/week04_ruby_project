require_relative('sql_runner.rb')
require_relative('../models/species.rb')

require ('pry')

Species.delete()

maranta = Species.new(
  {
    "name" => "Maranta",
    "common_name" => "Prayer Plant",
    "description" => "Maranta is a genus of flowering plants in the family Marantaceae, native to tropical Central and South America and the West Indies."
    })
    maranta.save()


    binding.pry
    nil
