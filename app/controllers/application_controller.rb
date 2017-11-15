class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  private
    ## ログイン済みユーザーかどうか
    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please Log in."
        redirect_to login_url
      end
    end
end
