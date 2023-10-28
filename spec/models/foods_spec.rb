require 'rails_helper'

RSpec.describe Food, type: :model do
  before do
    @user = User.create(name: 'Daniel', email: 'user2@example.com', password: 'user23')
    @food = Food.create(name: 'Saidi', measurement_unit: 'kg', price: 23, quantity: 300, user: @user)
  end

  it 'has a name' do
    expect(@food.name).to eq('Saidi')
  end

  it 'has the measurement unit "kg"' do
    expect(@food.measurement_unit).to eq('kg')
  end

  it 'has the price 23' do
    expect(@food.price).to eq 23
  end

  it 'is valid' do
    expect(@food).to be_valid
  end

  it 'has a user' do
    expect(@food.user.name).to eq('Daniel')
  end
end
