class ApplicationController < ActionController::Base
	 #before_filterを設定
  # before_filter :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
before_action :authenticate_user!,only: [:show, :edit, :new, :index]
  protected

  def configure_permitted_parameters
    #strong parametersを設定し、usernameを許可
    added_attrs = [ :email, :username, :password, :password_confirmation ]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
  end
   private

   def after_sign_up_path_for(resource_or_scope)
    root_path
  end

  # ログイン後のリダイレクト先
  def after_sign_in_path_for(resource_or_scope)
    root_path
  end

  # ログアウト後のリダイレクト先
  def after_sign_out_path_for(resource_or_scope)
    root_path
  end
end
