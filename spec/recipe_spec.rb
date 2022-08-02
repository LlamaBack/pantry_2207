require "./lib/recipe"

RSpec.describe Recipe do
  let(:ingredient1) {Ingredient.new({name: "Cheese", unit: "oz", calories: 50})}
  let(:ingredient2) {Ingredient.new({name: "Macaroni", unit: "oz", calories: 200})}
  let(:recipe1) {Recipe.new("Mac and Cheese")}

  it 'exists' do
    expect(recipe1).to be_an_instance_of(Recipe)
  end

  it 'has attributes' do
    expect(recipe1.name).to eq("Mac and Cheese")
    expect(recipe1.ingredients_required).to eq({})
  end

  it 'adds and records ingredients required' do
    recipe1.add_ingredient(ingredient1, 2)
    recipe1.add_ingredient(ingredient1, 4)
    recipe1.add_ingredient(ingredient2, 8)

    expect(recipe1.ingredients_required).to eq({ingredient1 => 6, ingredient2 => 8})
    expect(recipe1.ingredients).to eq([ingredient1, ingredient2])
  end


end
