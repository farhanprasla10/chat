require 'rails_helper'

RSpec.describe ChatRoomsController, type: :controller do

   describe "chat_rooms#index action" do
    it "should successfully show the page" do
      user = FactoryBot.create(:user)
      sign_in user
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "chat_rooms#new action" do
    it "should require users to be logged in" do
      get :new
      expect(response).to redirect_to new_user_session_path
    end

    it "should successfully show the new form" do
      user = FactoryBot.create(:user)
      sign_in user
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "chat_rooms#show action" do
    it "should successfully show the page if the chat_room is found" do
      chat_room = FactoryBot.create(:chat_room)
      get :show, params: { id: chat_room.id }
      expect(response).to have_http_status(302)
    end

    it "should return a 302 error if the chat_room is not found" do
      get :show, params: { id: 'TACOCAT' }
      expect(response).to have_http_status(302)
    end
  end

  describe "chat_rooms#create action" do
    
    it "should successfully create a new chat_room in our database" do
       user = FactoryBot.create(:user)
        sign_in user
        post :create, params: { chat_room: { title: 'Hello world!'  } }
        
        expect(response).to redirect_to chat_rooms_path
    end
   end 
end
