require 'rails_helper'

describe 'Recipe food', type: :request do
  before do
    @user = User.create(name: 'user', email: 'user2@example.com', password: 'user23')
    @user.confirm
    sign_in @user
  end

  describe 'Post #new' do
    it 'returns a successful response for recipe foods' do
      get '/recipes/2/recipe_foods/new'
      expect(response).to have_http_status(200)
    end

    it 'renders the error template' do
      get '/recipes/2/recipe_foods/new'
      expect(response).to render_template('error')
    end
  end
end
