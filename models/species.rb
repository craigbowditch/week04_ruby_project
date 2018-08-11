require_relative("../db/sql_runner.rb")

class Species
  attr_reader :id
  attr_accessor :name, :common_name, :description

  def initialize(options)
    @id = options["id"].to_i() if options["id"]
    @name = options["name"]
    @common_name = options["common_name"]
    @description = options["description"]
  end

  def save()
    sql = "INSERT into species (name, common_name, description) VALUES ($1, $2, $3) RETURNING id"
    values = [@name, @common_name, @description]
    result = SqlRunner.run(sql, values).first
    @id = result["id"].to_i()
  end

    def self.all()
      sql = "SELECT * FROM species"
      result = SqlRunner.run(sql)
      return result.map do |species| Species.new(species)
      end
    end



end
