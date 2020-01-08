require 'minitest/autorun'
require 'minitest/pride'
require './lib/ingredient'
require './lib/recipe'

class RecipeTest < Minitest::Test
  def setup
    @recipe = Recipe.new("Mac and Cheese")
    @ingredient1 = Ingredient.new("Cheese", "C", 100)
    @ingredient2 = Ingredient.new("Macaroni", "oz", 30)
  end

  def test_it_exists
    assert_instance_of Recipe, @recipe
  end

  def test_it_has_attributes
    assert_equal "Mac and Cheese", @recipe.name
    assert_equal ({}), @recipe.ingredients_required
    assert_equal [], @recipe.ingredients
  end

  def test_it_can_add_ingredients
    @recipe.add_ingredient(@ingredient1, 2)
    @recipe.add_ingredient(@ingredient2, 8)
    expected = {@ingredient1 => 2, @ingredient2 => 8}

    assert_equal expected, @recipe.ingredients_required
  end

  def test_it_can_get_amount_required
    assert_nil @recipe.amount_required(@ingredient1)

    @recipe.add_ingredient(@ingredient1, 2)
    @recipe.add_ingredient(@ingredient2, 8)

    assert_equal 2, @recipe.amount_required(@ingredient1)
    assert_equal 8, @recipe.amount_required(@ingredient2)
  end

  def test_it_can_update_ingredients
    @recipe.add_ingredient(@ingredient1, 2)
    @recipe.add_ingredient(@ingredient2, 8)

    assert_equal [@ingredient1, @ingredient2], @recipe.ingredients
  end

  def test_it_can_calculate_calories_of_ingredient
    @recipe.add_ingredient(@ingredient1, 2)

    assert_equal 200, @recipe.ingredient_calories(@ingredient1)
  end

  def test_it_can_calculate_total_calories
    @recipe.add_ingredient(@ingredient1, 2)
    @recipe.add_ingredient(@ingredient2, 8)

    assert_equal 440, @recipe.total_calories
  end
end
