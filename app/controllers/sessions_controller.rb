class SessionsController < ApplicationController

  def new 
  end

  def create
    user = User.login(params[:user][:email], params[:user][:password])
    if user 
      session[:user_id] = user.id
      redirect_to posts_path
    else
      render :new
    end
  end

  private
    def create_params
      params.require(:user).permit(:email, :password)
    end

end