require "./lib/cook_book"

RSpec.describe CookBook do

  let(:ingredient1) {Ingredient.new({name: "Cheese", unit: "C", calories: 100})}
  let(:ingredient2) {Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})}
  let(:ingredient3) {Ingredient.new({name: "Ground Beef", unit: "oz", calories: 100})}
  let(:ingredient4) {Ingredient.new({name: "Bun", unit: "g", calories: 75})}

  let(:recipe1) {Recipe.new("Mac and Cheese")}
  let(:recipe2) {Recipe.new("Cheese Burger")}

  let(:cookbook) {CookBook.new}

  it 'exists' do
    expect(cookbook).to be_an_instance_of(CookBook)
  end

  it 'adds and records recipes' do
    cookbook.add_recipe(recipe1)
    cookbook.add_recipe(recipe2)

    expect(cookbook.recipes).to eq([recipe1, recipe2])
  end

  it 'adds and records recipes' do
    recipe1.add_ingredient(ingredient1, 2)
    recipe1.add_ingredient(ingredient2, 4)

    recipe2.add_ingredient(ingredient1, 2)
    recipe2.add_ingredient(ingredient3, 4)
    recipe2.add_ingredient(ingredient4, 1)

    cookbook.add_recipe(recipe1)
    cookbook.add_recipe(recipe2)
    expect(cookbook.ingredients).to eq(["Cheese", "Macaroni", "Ground Beef", "Bun"])
  end

  it 'finds the highest_calorie_meal' do
    recipe1.add_ingredient(ingredient1, 2)
    recipe1.add_ingredient(ingredient2, 4)

    recipe2.add_ingredient(ingredient1, 2)
    recipe2.add_ingredient(ingredient3, 4)
    recipe2.add_ingredient(ingredient4, 1)

    cookbook.add_recipe(recipe1)
    cookbook.add_recipe(recipe2)

    expect(cookbook.highest_calorie_meal).to eq(recipe2)
  end
end
