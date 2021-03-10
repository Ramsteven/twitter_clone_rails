class TweetsController < ApplicationController

  def index
    @tweets = Tweet.all
  end

  def new
    @tweet = Tweet.new
  end 

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user = current_user 
    if @tweet.save
      flash[:notice] = "Tweet created"
      redirect_to root_path
    else
      flash[:error] = "something wrong happend"
      redirect_to root_path
    end
  end

  def tweet_params
    params.require(:tweet).permit(:body)
  end 
end
