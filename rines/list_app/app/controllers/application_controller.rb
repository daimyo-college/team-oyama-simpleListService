class ApplicationController < ActionController::Base
  # 非ログインでindex以外を見せないようにしたいがうまくいかないので保留
  # before_action :authenticate_user!, except: [:index]

  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end
end
