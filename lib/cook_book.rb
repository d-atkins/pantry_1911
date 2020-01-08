class CookBook
  attr_reader :recipes

  def initialize
    @recipes = []
  end

  def add_recipe(recipe)
    @recipes << recipe
  end

  def ingredient_report(recipe)
    report = []
    sorted_ingredients = recipe.ingredients.sort_by{|ingredient| ingredient.calories}
    sorted_ingredients.each do |ingredient|
      amount_string = "#{recipe.ingredients_required[ingredient]} #{ingredient.unit}"
      report << {ingredient: ingredient.name, amount: amount_string}
    end
    report
  end

  # def summary
  #   report = []
  # end
end
