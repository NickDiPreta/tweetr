class TweetsController < ApplicationController
  def index
    tweets = Tweet.all
    render json: { status: 200, tweets: tweets }
  end

  def show
    puts "show route: params #{params}"
    tweet = Tweet.find(params[:id])
    tweet_replies = tweet.replies
    render json: { status: 200, tweet: tweet, replies: tweet_replies }
  end

  def create 
    tweet = Tweet.new(tweet_params)

    if tweet.save
        render(status: 201, json: { tweet: tweet})
    else 
        redner(status: 422, json: { tweet: tweet})
    end 
  end

  def update
    tweet = Tweet.find(params[:id])
    tweet.update(tweet_params)
    render(json: {tweet: tweet})
  end

  def destroy
    tweet = Tweet.destroy(params[:id])
    render(status: 204)
  end

  private

  def tweet_params
    params.required(:tweet).permit(:title, :content, :author)
  end

end
