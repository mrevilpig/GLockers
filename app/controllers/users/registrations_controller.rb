class Users::RegistrationsController < Devise::RegistrationsController
  before_filter :configure_permitted_parameters

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :middle_name, :home_phone, :mobile_phone, :st_address, :apt_address, :city, :state_id, :zip, :preferred_branch_id) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :username, :email, :password, :remember_me, :first_name, :last_name, :middle_name, :home_phone, :mobile_phone, :st_address, :apt_address, :city, :state_id, :zip, :preferred_branch_id) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :email, :password, :password_confirmation, :current_password, :first_name, :last_name, :middle_name, :home_phone, :mobile_phone, :st_address, :apt_address, :city, :state_id, :zip, :preferred_branch_id) }
  end
end
