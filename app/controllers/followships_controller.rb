class FollowshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    user = User.find(params[:followee_id])
    current_user.follow(user)
    flash[:notice] = "user followee"
    redirect_to request.referrer
  end

  def destroy
    user = Followship.find(params[:id]).followee
    current_user.unfollow(user)
    flash[:notice] = "User unfollow"
    redirect_to request.referrer
  end
end
