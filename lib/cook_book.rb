class CookBook
  attr_reader :recipes

  def initialize
    @recipes = []
  end

  def add_recipe(recipe)
    @recipes << recipe
  end

  def ingredient_report(recipe)
    sorted_ingredients = recipe.ingredients.sort_by do |ingredient|
      1 / (ingredient.calories * recipe.ingredients_required[ingredient]).to_f
    end
    sorted_ingredients.map do |ingredient|
      amount_string = "#{recipe.ingredients_required[ingredient]} #{ingredient.unit}"
      {ingredient: ingredient.name, amount: amount_string}
    end
  end

  def summary
    @recipes.map do |recipe|
      recipe_report = Hash.new
      recipe_report[:name] = recipe.name
      recipe_report[:details] = Hash.new
      recipe_report[:details][:ingredients] = ingredient_report(recipe)
      recipe_report[:details][:total_calories] = recipe.total_calories
      recipe_report
    end
  end
end
