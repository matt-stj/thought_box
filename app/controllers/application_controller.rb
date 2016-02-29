require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html
  protect_from_forgery with: :null_session
  before_filter :require_login

  helper_method :current_user

  def current_user
    @user ||= User.find(session[:user_id]) if session[:user_id]
  end


private

  def require_login
    unless current_user
      redirect_to login_path
    end
  end
end
