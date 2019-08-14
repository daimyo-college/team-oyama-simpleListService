class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      log_in user          #sessions_helper
      redirect_to user_path(user)
    else
      flash.now[:danger] = "ログインに失敗しました"
      render 'new'
    end
  end

  def destroy
    log_out #sessions_helper
    redirect_to home_url
  end
end
