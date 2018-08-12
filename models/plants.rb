require_relative ('../db/sql_runner.rb')

class Plant
  attr_reader :id
  attr_accessor :name, :latin_name, :description, :stock_quantity, :buying_cost, :selling_price

  def initialize(options)
    @id = options["id"].to_i() if options["id"]
    @name = options["name"]
    @latin_name = options["latin_name"]
    @description = options["description"]
    @stock_quantity = options["stock_quantity"]
    @buying_cost = options["buying_cost"]
    @selling_price = options["selling_price"]
  end

  def save()
    sql = "INSERT into plants (name, latin_name, description, stock_quantity, buying_cost, selling_price) VALUES ($1, $2, $3, $4, $5, $6) RETURNING id"
    values = [@name, @latin_name, @description, @stock_quantity, @buying_cost, @selling_price]
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
    sql = "UPDATE plants SET (name, latin_name, description, stock_quantity, buying_cost, selling_price) = ($1, $2, $3, $4, $5, $6) Where id = $7"
    values = [@name, @latin_name, @description, @stock_quantity, @buying_cost, @selling_price, @id]
    result = SqlRunner.run(sql, values)
  end

  def self.delete()
    sql = "DELETE FROM plants"
    SqlRunner.run(sql)
  end



















end
