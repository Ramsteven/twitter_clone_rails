class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_user, only: [:followees, :followers]

    def index
      @users = set_paginate_order(User.all)
    end
    #function that get all followees
    def followees
      @followees = set_paginate_order(@user.followees)
    end

    #function that get all followers
    def followers
      @followers =set_paginate_order(@user.followers)
    end
      
    #following by username
    def follow_username   
    end

    #create following by username
    def follow_username_create
      user = User.find_by_username(params[:followee_id].downcase)
      if current_user.following?(user) 
        flash[:notice] = "user currently followee" 
        redirect_to follow_username_path    
      elsif user.nil?
         flash[:notice] = "user dont exist"
         redirect_to follow_username_path
      else
        current_user.follow(user)
        flash[:notice] = "user followee"
        redirect_to follow_username_path  
      end
    end

    # function that follow an user
    def follow(user)
      followees << user
    end


    # function that unfollow an user
    def unfollow(followed_user)
      followees.delete followed_user
    end

    # function that check if currently is following an given user
    def following?(other_user)
      followees.include?(other_user)
    end

    private

    def set_user
      @user = User.find(params[:id])
    end

    def set_paginate_order(user)
      user.order!(fullname: :asc).paginate(page: params[:page], per_page: 10)
    end
end
