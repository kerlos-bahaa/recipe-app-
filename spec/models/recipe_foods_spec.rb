require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  before do
    @user = User.create(name: 'Daniel', email: 'user2@example.com', password: 'user23')
    @food = Food.create(name: 'Saidi', measurement_unit: 'kg', price: 23, quantity: 300, user: @user)
    @recipe = Recipe.create(name: 'spaghetti', preperation_time: 1, cooking_time: 1, description: "Don't forget water",
                            public: true, user: @user)
    @recipe_foods = RecipeFood.create(quantity: 23, recipe: @recipe, food: @food)
  end

  it 'has a name of "spaghetti"' do
    expect(@recipe_foods.recipe.name).to eq('spaghetti')
  end

  it 'has a preperation_time of 1' do
    expect(@recipe_foods.recipe.preperation_time).to eq(1)
  end

  it 'has a cooking_time of 1' do
    expect(@recipe_foods.recipe.cooking_time).to eq(1)
  end

  it 'has a description of "Don\'t forget water"' do
    expect(@recipe_foods.recipe.description).to eq("Don't forget water")
  end

  it 'is public' do
    expect(@recipe_foods.recipe.public).to eq(true)
  end

  it 'has a user named "Daniel"' do
    expect(@recipe_foods.recipe.user.name).to eq('Daniel')
  end
end
