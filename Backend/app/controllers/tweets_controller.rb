class TweetsController < ApplicationController

    def index 
        start_date = params[:start]
        end_date = params[:end]
        hashtag = params[:hashtag]
        tweets1 = Tweet.all.select do |tweet|
            tweet.hashtag == hashtag
        end
        tweets2 = tweets1.select do |tweet|
            start_date.to_i <= tweet.date.to_i && tweet.date.to_i <= end_date.to_i
        end 
        render json: tweets2
    end 

    def show 
        tweet = Tweet.find(params[:id])
        render json: tweet
    end 

end

