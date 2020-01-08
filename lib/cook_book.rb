class CookBook
  attr_reader :recipes

  def initialize
    @recipes = []
  end

  def add_recipe(recipe)
    @recipes << recipe
  end

  # def summary
  #   report = []
  #   require "pry"; binding.pry
  # end
end
