class FoodsController < ApplicationController
  before_action :authenticate_user!
  def index
    @foods = current_user.foods.all
  end

  def new
    @foods = current_user.foods.all
  end

  def create
    para = params[:food]
    Food.create('name' => para['name'], 'measurement_unit' => para['measurement_unit'],
                'price' => para['price'], 'quantity' => para['quantity'], 'user' => current_user)
    redirect_to '/foods'
  end

  def destroy
    @food = Food.find_by(id: params[:id])
    @food.recipe_foods.destroy_all
    @food.destroy
    redirect_to '/foods'
  end

  def show; end
end
