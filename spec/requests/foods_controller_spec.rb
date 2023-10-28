require 'rails_helper'

describe 'Foods controller', type: :request do
  describe 'With logged in user' do
    before do
      @user = User.create(name: 'user', email: 'user2@example.com', password: 'user23')
      @user.confirm
      sign_in @user
    end

    describe 'GET #index' do
      it 'returns a successful response for the food conroller' do
        get '/foods'
        expect(response).to have_http_status(200)
      end

      it 'renders the foods index template' do
        get '/foods'
        expect(response).to render_template('index')
      end
    end

    describe 'Post #index' do
      it 'renders the foods form' do
        get '/foods/new'
        expect(response).to have_http_status(200)
      end

      it 'renders the foods form' do
        get '/foods/new'
        expect(response).to render_template('new')
      end
    end
  end

  describe 'GET #index' do
    it 'returns a successful response for the food conroller' do
      get '/foods'
      expect(response).to have_http_status(302)
    end
  end
end
