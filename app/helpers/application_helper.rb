module ApplicationHelper

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    end
  end

  def logout_user
    session[:user_id] = nil
    @current_user = nil
  end

end
