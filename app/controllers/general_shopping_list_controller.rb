class GeneralShoppingListController < ApplicationController
  def index
    @amount = 0
    @recipe = Recipe.includes(:foods, :recipe_foods).find_by(id: params[:id])
    @recipe.recipe_foods.each do |food|
      @amount += food.food.price.to_i * food.food.quantity.to_i
    end
  end
end
