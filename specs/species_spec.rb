require("minitest/autorun")
require_relative("../models/species.rb")

class TestSpecies < MiniTest::Test

  def setup
options =
{
  "name" => "Maranta",
  "common_name" => "Prayer Plant",
  "description" => "Maranta is a genus of flowering plants in the family Marantaceae, native to tropical Central and South America and the West Indies.",
  "image" => "/images/Maranta.jpg"
  }

@species = Species.new(options)
  end


  def test_name()
    result = @species.name()
    assert_equal("Maranta", result)
  end

  def test_common_name()
    result = @species.common_name()
    assert_equal("Prayer Plant", result)
  end

  def test_description()
    result = @species.description()
assert_equal("Maranta is a genus of flowering plants in the family Marantaceae, native to tropical Central and South America and the West Indies.", result)
  end

  def test_image()
    result = @species.image()
    assert_equal("/images/Maranta.jpg", result)
  end
end
