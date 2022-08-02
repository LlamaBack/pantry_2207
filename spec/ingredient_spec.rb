require "./lib/ingredient"

RSpec.describe Ingredient do
  let(:ingredient1) {Ingredient.new({name: "Cheese", unit: "oz", calories: 50})}
  it 'exists' do
    expect(ingredient1).to be_an_instance_of(Ingredient)
  end
end
