require "./lib/cook_book"

RSpec.describe CookBook do

  let(:ingredient1) {Ingredient.new({name: "Cheese", unit: "C", calories: 100})}
  let(:ingredient2) {Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})}
  let(:ingredient3) {Ingredient.new({name: "Ground Beef", unit: "oz", calories: 100})}
  let(:ingredient4) {Ingredient.new({name: "Bun", unit: "g", calories: 1})}

  let(:recipe1) {Recipe.new("Mac and Cheese")}
  let(:recipe2) {Recipe.new("Burger")}

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

  it 'records date recipe was created' do
    expect(cookbook.date).to eq(Time.now.strftime("%m-%d-%Y"))
  end

  it 'summarizes itself' do
    recipe1.add_ingredient(ingredient1, 2)
    recipe1.add_ingredient(ingredient2, 8)
    recipe2.add_ingredient(ingredient3, 4)
    recipe2.add_ingredient(ingredient4, 100)
    cookbook.add_recipe(recipe1)
    cookbook.add_recipe(recipe2)
    expect(cookbook.summary).to eq([{:name=>"Mac and Cheese",
                                    :details=>{
                                      :ingredients=>[{:ingredient=>"Macaroni", :amount=>"8 oz"}, {:ingredient=>"Cheese", :amount=>"2 C"}],
                                      :total_calories=>440}},
                                    {:name=>"Burger",
                                    :details=>{
                                      :ingredients=>[{:ingredient=>"Ground Beef", :amount=>"4 oz"},{:ingredient=>"Bun", :amount=>"100 g"}],
                                      :total_calories=>500}}])
  end
end
