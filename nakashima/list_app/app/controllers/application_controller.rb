class ApplicationController < ActionController::Base
  include SessionsHelper
  before_action :login_required

  private
    def login_required
      unless current_user
        redirect_to login_path, notice: "ログインしてください"
      end
    end
end
