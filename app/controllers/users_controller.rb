class UsersController < ApplicationController
    def index
      @users = User.all.order!(fullname: :asc).paginate(page: params[:page], per_page: 10)
    end

    def followees
      @user = User.find(params[:id])
      @followees = @user.followees.order!(fullname: :asc).paginate(page: params[:page], per_page: 10)
    end

    def followers
      @user = User.find(params[:id])
      @followers = @user.followers.order!(fullname: :asc).paginate(page: params[:page], per_page: 10)
    end
  
    def follow_username
      @user = User.all
    end

    def follow(user)
      followees << user
    end

    def unfollow(followed_user)
      followees.delete followed_user
    end

    def following?(other_user)
      followees.include?(other_user)
    end

end
