class TweetsController < ApplicationController
    def index
        tweets = Tweet.all
        render json: { status: 200, tweets: tweets}
    end

    def show
        puts "show route: params #{params}"
        tweet = Tweet.find(params[:id])
        render json: { status: 200, tweet: tweet }
      end

end