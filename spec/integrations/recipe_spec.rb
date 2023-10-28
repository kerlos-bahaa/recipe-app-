require 'rails_helper'

RSpec.describe 'Recipe ', type: :feature do
  describe 'index page' do
    before do
      @user = User.create(name: 'user', email: 'user2@example.com', password: 'user23')
      @user.confirm
      sign_in @user
    end

    it 'should have a list of recipes' do
      visit recipes_path
      expect(page).to have_css('.recipe-item-list')
    end

    it 'should have a link to each recipe' do
      visit recipes_path
      recipes = page.all('.recipe-item')
      recipes.each do |recipe|
        expect(recipe).to have_link(recipe.text)
      end
    end

    it 'should have a remove button for each recipe' do
      visit recipes_path
      recipes = page.all('.recipe-item')
      recipes.each do |recipe|
        expect(recipe).to have_button('Remove')
      end
    end
  end

  describe 'post index' do
    before do
      @user = User.create(name: 'user', email: 'user2@example.com', password: 'user23')
      @user.confirm
      sign_in @user
    end

    it 'should have a form for creating a recipe' do
      visit new_recipe_path

      expect(page).to have_field('Name')
      expect(page).to have_field('Cooking time')
      expect(page).to have_field('Description')
      expect(page).to have_button('Add Recipe')
    end

    it 'should create a new recipe' do
      visit new_recipe_path

      fill_in 'Name', with: 'My Recipe'
      fill_in 'Cooking time', with: '20'
      fill_in 'Description', with: 'This is my recipe'
      check 'Public'
      click_button 'Add Recipe'
    end
  end
end
