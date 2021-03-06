class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:user_name])
  end

  before_action :set_current_user
  def set_current_user
  @current_user = User.find_by(id: session[:user_id])
end
end
