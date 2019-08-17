module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

  def logged_in?
    !!current_user.nil?
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  # def current_list
  #   if session[:user_id] && 
  # end
  # def current_list
  #   @list = @user.lists.build
  #   @current_list = @list.id
  # end
  # def current_list
  #   @current_list = List.find_by(id: params[:id])
  # end
end
