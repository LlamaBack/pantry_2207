class Pantry
  attr_reader :stock
  def initialize
    @stock = Hash.new(0)
  end

  def restock(ingredient, quantity)
    @stock[ingredient] += quantity
  end

  def stock_check(ingredient)
    @stock[ingredient]
  end

  def enough_ingredients_for?(recipe)
    recipe.ingredients_required.map do |ingredient, quantity|
      if !@stock.has_key?(ingredient) || @stock[ingredient] < quantity
        return false
      end
    end
    return true
  end
end
