class UsersController < ApplicationController

   def new
      @user = User.new
    end

    def create
      @new_user = User.new(user_params)

      if @new_user.save!
        redirect_to posts_path
      else
        render :new
      end
    end

    def edit
      @user = User.find(params[:id])
    end

    def update
      @user_to_edit = User.find(params[:id])
      @user_to_edit.update(user_params)
      redirect_to root_path
    end

    def destroy
      User.destroy(params[:id])
      redirect_to root_path
    end

private

    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

end
