require 'rails_helper'

describe 'Public recipe', type: :request do
  before do
    @user = User.create(name: 'user', email: 'user2@example.com', password: 'user23')
    @user.confirm
    sign_in @user
  end

  describe 'GET #index' do
    it 'returns a successful response for public recipes' do
      get '/public_recipes'
      expect(response).to have_http_status(200)
    end

    it 'renders the public recipes index template' do
      get '/recipes'
      expect(response).to render_template('index')
    end
  end
end
