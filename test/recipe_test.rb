require 'minitest/autorun'
require 'minitest/pride'
require './lib/ingredient'
require './lib/recipe'

class RecipeTest < Minitest::Test
  def setup
    @recipe = Recipe.new("Mac and Cheese")
  end

  def test_it_exists
    assert_instance_of Recipe, @recipe
  end

  def test_it_has_attributes
    assert_equal "Mac and Cheese", @recipe.name
    assert_equal ({}), @recipe.ingredients_required
  end

  def test_it_can_add_ingredients
    ingredient1 = Ingredient.new("Cheese", "C", 100)
    ingredient2 = Ingredient.new("Macaroni", "oz", 30)
    @recipe.add_ingredient(ingredient1, 2)
    @recipe.add_ingredient(ingredient2, 8)
    expected = {ingredient1 => 2, ingredient2 => 8}
    
    assert_equal expected, @recipe.ingredients_required
  end
end
