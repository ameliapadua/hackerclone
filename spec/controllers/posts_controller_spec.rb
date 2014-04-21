require 'spec_helper'

describe PostsController do

  describe 'index' do
    it "renders the posts index page" do 
      get :index

      response.should be_success
      assigns(:posts).should =~ Post.all
    end
  end

  describe 'show' do 
    it "renders the post and its comments" do 
      post = Post.create(title: "Sweet", content: "Really want to get rspec working today", url: "http://www.ameliapadua.com", user_id: 1)
      get :show, id: post.id

      response.should be_success
      assigns(:post).should_not be_nil
      assigns(:comments).should_not be_nil
    end
  end

  describe 'new' do 
    it "renders the form to create a post" do 
      get :new

      response.should be_success
      assigns(:post).should_not be_nil
    end
  end

end