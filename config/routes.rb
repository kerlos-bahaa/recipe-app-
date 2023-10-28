Rails.application.routes.draw do
  devise_for :users , path:'/' #, path_name:{sign_in: 'login' , sign_out: 'logout' , sign_up: 'sign_up'}
  root to: 'recipes#index'

  get '/general_shopping_list' , to: 'general_shopping_list#index'
  get '/public_recipes' , to: 'public_recipes#index'

  resources :recipes, :foods do
    resources :recipe_foods
  end

end
