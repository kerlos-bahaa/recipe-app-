class RecipeFoodsController < ApplicationController
  def create
    recipe = Recipe.includes(:recipe_foods).find_by(id: params[:recipe_id])
    params.permit!
    para = params[:name]
    food = Food.find_by(id: para)
    quantity = params[:food]
    unless recipe.recipe_foods.exists?(food: food)
      RecipeFood.create('quantity' => quantity['quantity'], 'recipe' => recipe, 'food' => food)
    end
    redirect_to "/recipes/#{params[:recipe_id]}"
  end

  def new
    @food = Recipe.find_by(id: params[:recipe_id])
    authorize! :new, @food
    @recipe = Recipe.find_by(id: params[:recipe_id])
  rescue StandardError
    flash.now[:notice] = 'You do not have the necessary permissions to add new ingredients.'
    render('recipes/error')
  end

  def destroy
    recipe = Recipe.find_by(id: params[:recipe_id])
    food = recipe.recipe_foods.find_by(id: params[:id])
    food.destroy
    redirect_to "/recipes/#{params[:recipe_id]}"
  end
end
