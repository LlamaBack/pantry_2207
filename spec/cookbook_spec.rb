require "./lib/cook_book"

RSpec.describe CookBook do
  let(:recipe1) {Recipe.new("Cheese Burger")}
  let(:recipe2) {Recipe.new("Double Cheese Burger")}
  let(:cookbook) {CookBook.new}

  it 'exists' do
    expect(cookbook).to be_an_instance_of(CookBook)
  end

  it 'adds and records recipes' do
    cookbook.add_recipe(recipe1)
    cookbook.add_recipe(recipe2)

    expect(cookbook.recipes).to eq([recipe1, recipe2])
  end
end
