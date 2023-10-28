class RecipesController < ApplicationController
  before_action :authenticate_user!

  def index
    @recipes = current_user.recipes.all
  end

  def show
    @recipe = Recipe.find_by(id: params[:id])
    authorize! :read, @recipe
  rescue StandardError
    flash.now[:notice] = 'You do not have the necessary permissions to view this page.'
    render('recipes/error')
  end

  def create
    recipe = params[:recipe]
    recipe['user'] = current_user
    params.permit!
    Recipe.create(recipe)
    redirect_to '/recipes'
  end

  def destroy
    @recipe = Recipe.find_by(id: params[:id])
    authorize! :destroy, @recipe
    fdr = @recipe.recipe_foods.where(recipe_id: @recipe.id)
    fdr.destroy_all
    @recipe.destroy
    redirect_to '/index'
  end

  def update
    @recipe = Recipe.find_by(id: params[:id])
    @recipe.public = !@recipe.public
    @recipe.save
  end
end
