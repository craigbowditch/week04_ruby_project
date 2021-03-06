require_relative ('../db/sql_runner.rb')

class Plant
  attr_reader :id, :species_id
  attr_accessor :name, :latin_name, :description, :stock_quantity, :buying_cost, :selling_price, :image

  def initialize(options)
    @id = options["id"].to_i() if options["id"]
    @name = options["name"]
    @latin_name = options["latin_name"]
    @description = options["description"]
    @stock_quantity = options["stock_quantity"].to_i()
    @buying_cost = options["buying_cost"].to_i()
    @selling_price = options["selling_price"].to_i()
    @species_id = options["species_id"].to_i()
    @image = options["image"]
  end

  def save()
    sql = "INSERT into plants (name, latin_name, description, stock_quantity, buying_cost, selling_price, species_id, image) VALUES ($1, $2, $3, $4, $5, $6, $7, $8) RETURNING id"
    values = [@name, @latin_name, @description, @stock_quantity, @buying_cost, @selling_price, @species_id, @image]
    result = SqlRunner.run(sql, values).first
    @id = result["id"].to_i()
  end

  def self.all()
    sql = "SELECT * from plants"
    result = SqlRunner.run(sql)
    return result.map do |plant| Plant.new(plant)
    end
  end

  def update()
    sql = "UPDATE plants SET (name, latin_name, description, stock_quantity, buying_cost, selling_price, image) = ($1, $2, $3, $4, $5, $6, $7) Where id = $8"
    values = [@name, @latin_name, @description, @stock_quantity, @buying_cost, @selling_price, @image, @id]
    result = SqlRunner.run(sql, values)
  end

  def self.delete()
    sql = "DELETE FROM plants"
    SqlRunner.run(sql)
  end

  def delete_one()
    sql = "DELETE FROM plants WHERE id = $1"
    values = [@id]
    result = SqlRunner.run(sql, values)
  end

  def species()
    sql = "SELECT * FROM species WHERE id = $1"
    values = [@species_id]
    result = SqlRunner.run(sql, values).first
    return Species.new(result)
  end

  def self.find( id )
    sql = "SELECT * FROM plants WHERE id = $1"
    values = [id]
    plant = SqlRunner.run( sql, values )
    result = Plant.new(plant.first)
    return result
  end

  def stock_level()
    if @stock_quantity == 0
      return "Out Of Stock"
    elsif @stock_quantity < 3
      return "Low Stock"
    else
      return "In Stock"
    end
  end

  def stock_level_colour()
    if @stock_quantity == 0
      return "out"
    elsif @stock_quantity < 3
      return "low"
    else
      return "in"
    end
  end
end
