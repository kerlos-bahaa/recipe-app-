require 'rails_helper'

RSpec.describe 'Recipe Food', type: :feature do
  describe 'index page' do
    before do
      @user = User.create(name: 'user', email: 'user2@example.com', password: 'user23')
      @user.confirm
      sign_in @user
      @food = Food.create(name: 'Saidi', measurement_unit: 'kg', price: 23, quantity: 300, user: @user)
      @recipe = Recipe.create(name: 'spaghetti', preperation_time: 1, cooking_time: 1,
                              description: "Don't forget water",
                              public: true, user: @user)
    end

    it 'should have the recipe name' do
      visit "/recipes/#{@recipe.id}"
      expect(page).to have_content(@recipe.name)
    end

    it 'should have the preparation time' do
      visit "/recipes/#{@recipe.id}"
      expect(page).to have_content(@recipe.preperation_time)
    end

    it 'should have the cooking time' do
      visit "/recipes/#{@recipe.id}"
      expect(page).to have_content(@recipe.cooking_time)
    end

    it 'should have the recipe steps' do
      visit "/recipes/#{@recipe.id}"
      expect(page).to have_content('Steps goes here. . .')
    end

    it 'should have a public checkbox' do
      visit "/recipes/#{@recipe.id}"
      expect(page).to have_css('.custom-control-input')
    end

    it 'should have a generate shopping list button' do
      visit "/recipes/#{@recipe.id}"
      expect(page).to have_link('Generate shopping list')
    end

    it 'should have an add ingredient button' do
      visit "/recipes/#{@recipe.id}"
      expect(page).to have_link('Add ingredient')
    end

    it 'should have a table of ingredients' do
      visit "/recipes/#{@recipe.id}"
      expect(page).to have_css('table')
    end

    it 'should have a row for each ingredient' do
      visit "/recipes/#{@recipe.id}"
      @recipe.recipe_foods.each do |food|
        expect(page).to have_content(food.food.name)
        expect(page).to have_content(food.food.quantity)
        expect(page).to have_content(food.food.measurement_unit)
        expect(page).to have_link('Modify')
        expect(page).to have_link('Remove')
      end
    end
  end
end
