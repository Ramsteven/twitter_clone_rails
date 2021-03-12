class TweetsController < ApplicationController
  before_action :authenticate_user!, except: [:show]

  def index
    ids = []
    ids.append(current_user.id)
    current_user.followees.each do |user|
        ids.append(user.id)  
    end
    @feed = set_paginate_order(Tweet.where(user_id: ids))
  end
  
  def new
    @tweet = Tweet.new
  end
 
  def show
    @user = User.find_by_username(params[:username])
    @tweets =  set_paginate_order(@user.tweets)
  end


  def create
    @tweet = current_user.tweets.new(tweet_params)
    if @tweet.save
      flash[:notice] = "Tweet created"
      redirect_to root_path
    else
      flash[:error] = "something wrong happend"
      redirect_to root_path
    end
  end

  private 

  def tweet_params
    params.require(:tweet).permit(:body)
  end

   def set_paginate_order(user)
      user.order!(created_at: :desc).paginate(page: params[:page], per_page: 10)
    end

end
