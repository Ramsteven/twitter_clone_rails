class UsersController < ApplicationController
    def index
      @users = User.all
    end

    def followees
      @followees = current_user.followees
    end

    def followers
      @followers = current_user.followers
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
