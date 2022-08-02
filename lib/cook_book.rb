class CookBook
  attr_reader :recipes, :ingredients
  def initialize
    @recipes = []
    @ingredients = []
  end

  def add_recipe(recipe)
    @recipes << recipe

    recipe.ingredients.map do |ingredient|
      if !ingredients.include?(ingredient.name)
        @ingredients << ingredient.name
      end
    end
  end

  def highest_calorie_meal
    fattest_recipe = @recipes.max { |a, b| a.total_calories <=> b.total_calories }
  end
end
