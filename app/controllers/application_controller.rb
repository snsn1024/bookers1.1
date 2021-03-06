class ApplicationController < ActionController::Base

  def after_sign_in_path_for(resource)
    user_path(current_user.id)
  end

  before_action :configure_permitted_parameters, if: :devise_controller?
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name,:profile_image,:intro])
  end
end

