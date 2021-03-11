class ApplicationController < ActionController::Base
  # helper_method :follow, :unfollow, :following?

  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :password_confirmation])
  end


  # def follow(user)
  #   followees << user
  # end

  # def unfollow(followed_user)
  #   followees.delete followed_user
  # end

  # def following?(other_user)
  #   followees.include?(other_user)
  # end



end
