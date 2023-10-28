require 'rails_helper'

RSpec.describe 'Recipe Food', type: :feature do
  describe 'index page' do
    before do
      @user = User.create(name: 'user', email: 'user2@example.com', password: 'user23')
      @user.confirm
      sign_in @user
      @food = Food.create(name: 'Saidi', measurement_unit: 'kg', price: 23, quantity: 300, user: @user)
      @recipe = Recipe.create(name: 'spaghetti',
                              preperation_time: 1,
                              cooking_time: 1,
                              description: "Don't forget water",
                              public: true, user: @user)
    end

    it 'should have a button to add a food' do
      visit foods_path

      expect(page).to have_link('Add Food')
    end

    it 'should have a table of foods' do
      visit foods_path

      expect(page).to have_css('table')
    end

    it 'should have a row for each food' do
      visit foods_path

      expect(page).to have_content(@food.name)
      expect(page).to have_content(@food.quantity)
      expect(page).to have_link('Delete')
    end
  end
end
