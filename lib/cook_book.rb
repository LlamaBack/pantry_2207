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
end
