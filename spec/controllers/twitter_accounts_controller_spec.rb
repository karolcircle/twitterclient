require 'rails_helper'

describe TwitterAccountsController do 
  
  describe 'GET #show' do
    it "renders the :show template" do
      user = FactoryGirl.create(:user)        
      allow(request.env['warden']).to receive(:authenticate!).and_return(user)
      allow(controller).to receive(:current_user).and_return(user)   
      twitter_account = TwitterAccount.create(name: "test", user_id: user.id)
      
      get :show, id: twitter_account
      expect(response).to render_template :show
    end
  end

  describe 'GET #new' do
    it "renders mplate" do
      user = FactoryGirl.create(:user)        
      allow(request.env['warden']).to receive(:authenticate!).and_return(user)
      allow(controller).to receive(:current_user).and_return(user)   
      
      get :new
      expect(assigns(:twitter_account)).to be_a_new(TwitterAccount)
    end
  
    it "renders the :new template" do
      user = FactoryGirl.create(:user)        
      allow(request.env['warden']).to receive(:authenticate!).and_return(user)
      allow(controller).to receive(:current_user).and_return(user)   
      
      get :new
      expect(response).to render_template :new
    end
  end  
end
