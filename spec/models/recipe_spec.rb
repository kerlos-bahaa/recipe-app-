require 'rails_helper'

RSpec.describe Recipe, type: :model do
  before do
    @user = User.create(name: 'Daniel', email: 'user2@example.com', password: 'user23')
    @food = Food.create(name: 'Saidi', measurement_unit: 'kg', price: 23, quantity: 300, user: @user)
    @recipe = Recipe.create(name: 'spaghetti', preperation_time: 1, cooking_time: 1, description: "Don't forget water",
                            public: true, user: @user)
  end

  it 'has a name' do
    expect(@recipe.name).to eq('spaghetti')
  end

  it 'has the preperation_time' do
    expect(@recipe.preperation_time).to eq(1)
  end

  it 'has cooking_time: 1' do
    expect(@recipe.cooking_time).to eq(1)
  end

  it 'has the description' do
    expect(@recipe.description).to eq("Don't forget water")
  end

  it 'has the description' do
    expect(@recipe.public).to eq(true)
  end

  it 'has a user' do
    expect(@recipe.user.name).to eq('Daniel')
  end
end
