require("minitest/autorun")
require_relative("../models/plants.rb")
require_relative("../models/species.rb")

class TestPlants < MiniTest::Test

  def setup
options =
    {
      "name" => "Red Prayer Plant",
      "latin_name" => "Maranta leuconeura var. erythroneura",
      "description" => "Red prayer plant shows off dark green leaves, purple markings, and rich red veins.",
      "stock_quantity" => 4,
      "buying_cost" => 5,
      "selling_price" => 10,
      "image" => "/images/red_prayer_plant.png"
      }

@plants = Plant.new(options)
  end

  def test_name()
    result = @plants.name()
    assert_equal("Red Prayer Plant", result)
  end

  def test_latin_name()
    result = @plants.latin_name()
    assert_equal("Maranta leuconeura var. erythroneura", result)
  end

  def test_description()
    result = @plants.description()
    assert_equal("Red prayer plant shows off dark green leaves, purple markings, and rich red veins.", result)
  end

  def test_stock_quantity()
    result = @plants.stock_quantity()
    assert_equal(4, result)
  end

  def test_buying_cost()
    result = @plants.buying_cost()
    assert_equal(5, result)
  end

  def test_selling_price()
    result = @plants.selling_price()
    assert_equal(10, result)
  end

  def test_image()
    result = @plants.image()
    assert_equal("/images/red_prayer_plant.png", result)
  end

  def test_stock_level()
    assert_equal("In Stock", @plants.stock_level)
  end

  def test_stock_level_colour()
    assert_equal("in", @plants.stock_level_colour)
  end
end
