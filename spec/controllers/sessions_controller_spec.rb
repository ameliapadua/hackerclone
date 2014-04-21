require 'spec_helper'

describe SessionsController do 

  describe 'new' do 
    it "renders page to sign in" do 
      get :new

      response.should be_success
    end
  end
  
  describe 'create' do 
    it "signs user in, adds user id to session" do 
      user = User.create!(email: "foo@example.com", password: "password")

      post :create, user: {
        email: "foo@example.com",
        password: "password"
      }

      session[:user_id].should == user.id
      response.should redirect_to(posts_path)
    end

    it "does not sign in invalid user" do 
      post :create, user: {
        email: "foo@example.com",
        password: "password"
      }

      session[:user_id].should_not be
      response.should render_template("new")
    end
  end

end