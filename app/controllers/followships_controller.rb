class FollowshipsController < ApplicationController
  before_action :user_signed_in?

  def create
    user = User.find(params[:followee_id])
    current_user.follow(user)
    redirect_to users_path
  end

  def destroy
    user = Followship.find(params[:id]).followee
    current_user.unfollow(user)
    redirect_to users_path
  end
end
