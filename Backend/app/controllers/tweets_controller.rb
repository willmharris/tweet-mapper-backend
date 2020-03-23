class TweetsController < ApplicationController

    def index 
        start_date = params[:start]
        end_date = params[:end]
        hashtag1 = params[:hashtag1]
        hashtag2 = params[:hashtag2]
        tweetsa1 = Tweet.all.select do |tweet|
            tweet.hashtag == hashtag1
        end
        tweetsa2 = tweetsa1.select do |tweet|
            start_date.to_i <= tweet.date.to_i && tweet.date.to_i <= end_date.to_i
        end 
        tweetsb1 = Tweet.all.select do |tweet|
            tweet.hashtag == hashtag2
        end
        tweetsb2 = tweetsb1.select do |tweet|
            start_date.to_i <= tweet.date.to_i && tweet.date.to_i <= end_date.to_i
        end 
        results = [tweetsa2, tweetsb2]
        render json: results
    end 

    def show 
        tweet = Tweet.find(params[:id])
        render json: tweet
    end 

end

