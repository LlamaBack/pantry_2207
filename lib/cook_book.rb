class CookBook
  attr_reader :recipes, :ingredients, :date
  def initialize
    @recipes = []
    @ingredients = []
    @date = Time.now.strftime("%m-%d-%Y")
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

  def summary
    sum = []
    @recipes.each do |recipe|
      entry = {}
      entry[:name] = recipe.name
      entry[:details] = {}
      entry[:details][:ingredients] = []
      recipe.ingredients_required.each do |ingredient, quantity|
        piece = {}
        piece[:ingredient] = ingredient.name
        piece[:amount] = "#{quantity} #{ingredient.unit}"
        piece[:calories] = ingredient.calories * quantity
        entry[:details][:ingredients] << piece
      end

      entry[:details][:ingredients] = entry[:details][:ingredients].sort_by{|piece| piece[:calories]}.reverse!
      n_array = []
      entry[:details][:ingredients].map do |piece|
        piece.delete(:calories)
        n_array << piece
      end

      entry[:details][:ingredients] = n_array

      entry[:details][:total_calories] = recipe.total_calories
      sum << entry
    end
    return sum
  end
end
