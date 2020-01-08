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
    sorted_ingredients = recipe.ingredients.sort_by do |ingredient|
      1 / (ingredient.calories * recipe.ingredients_required[ingredient]).to_f
    end
    sorted_ingredients.each do |ingredient|
      amount_string = "#{recipe.ingredients_required[ingredient]} #{ingredient.unit}"
      report << {ingredient: ingredient.name, amount: amount_string}
    end
    report
  end

  def summary
    report = []
    @recipes.each do |recipe|
      recipe_report = Hash.new
      recipe_report[:name] = recipe.name
      recipe_report[:details] = Hash.new
      recipe_report[:details][:ingredients] = ingredient_report(recipe)
      recipe_report[:details][:total_calories] = recipe.total_calories
      report << recipe_report
    end
    report
  end
end
