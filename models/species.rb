require_relative("../db/sql_runner.rb")

class Species
  attr_reader :id
  attr_accessor :name, :common_name, :description, :image

  def initialize(options)
    @id = options["id"].to_i() if options["id"]
    @name = options["name"]
    @common_name = options["common_name"]
    @description = options["description"]
    @image = options["image"]
  end

  def save()
    sql = "INSERT into species (name, common_name, description, image) VALUES ($1, $2, $3, $4) RETURNING id"
    values = [@name, @common_name, @description, @image]
    result = SqlRunner.run(sql, values).first
    @id = result["id"].to_i()
  end

    def self.all()
      sql = "SELECT * FROM species"
      result = SqlRunner.run(sql)
      return result.map do |species| Species.new(species)
      end
    end

    def update()
      sql = "UPDATE species SET (name, common_name, description, image) = ($1, $2, $3, $4) WHERE id = $5"
      values = [@name, @common_name, @description, @id]
      result = SqlRunner.run(sql, values)
    end

    def self.delete()
      sql = "DELETE FROM species"
      SqlRunner.run(sql)
    end

    def delete_one()
      sql = "DELETE FROM species WHERE id = $1"
      values = [@id]
      result = SqlRunner.run(sql, values)
    end

    def plants()
      sql = "SELECT * FROM plants WHERE species_id = $1"
      values = [@id]
      result = SqlRunner.run(sql, values)
      return result.map do |plant| Plant.new(plant)
      end
    end

    def self.find(id)
      sql = "SELECT * FROM species WHERE id = $1"
      values = [id]
      species = SqlRunner.run(sql, values)
      result = Species.new(species.first)
      return result
    end



end
