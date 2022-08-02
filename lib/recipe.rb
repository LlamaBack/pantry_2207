class Recipe
  attr_reader :name, :ingredients_required, :ingredients
  def initialize(name)
    @name = name
    @ingredients_required = Hash.new(0)
    @ingredients = []
  end

  def add_ingredient(ingredient, quantity)
    ingredients_required[ingredient] += quantity
    if !ingredients.include? ingredient
      ingredients << ingredient
    end
  end

  def total_calories
    total_cal = 0
    @ingredients_required.each do |ingredient, quantity|
      total_cal += ingredient.calories * quantity
    end
    total_cal
  end
end
