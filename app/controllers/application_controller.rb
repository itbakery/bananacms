class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?
  layout :layout_by_resource
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation, :remember_me, profile_attributes: [:first_name, :last_name, :address, :city, :province, :country, :postal_code, :coordinates, :latitude, :longitude, :full_address]) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :username, :email, :password,:profile, :remember_me, profile_attributes: [:first_name, :last_name, :address, :city, :province, :country, :postal_code, :coordinates, :latitude, :longitude, :full_address]) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :email, :password, :password_confirmation, :current_password) }
  end
 
  def layout_by_resource
      if devise_controller?
          "devise"
      else
          "application"
      end
  end

end
