require 'rails_helper'

describe 'Recipe', type: :request do
  before do
    @user = User.create(name: 'user', email: 'user2@example.com', password: 'user23')
    @user.confirm
    sign_in @user
  end

  describe 'GET #index' do
    it 'returns a successful response' do
      get '/recipes'
      expect(response).to have_http_status(200)
    end

    it 'renders the index template' do
      get '/recipes'
      expect(response).to render_template('index')
    end
  end

  describe 'GET #show' do
    it 'returns a successful response' do
      get '/recipes/1'
      expect(response).to have_http_status(200)
    end

    it 'renders the error template' do
      get '/recipes/1'
      expect(response).to render_template('error')
    end

    it 'renders the recipe form' do
      get '/recipes/new'
      expect(response).to render_template('new')
    end
  end
end
