class TweetsController < ApplicationController
    def create   
        # Get information from the parameters 
        payload = params[:payload]
        start_date = payload[:start].to_i
        end_date = payload[:end].to_i 
        # Iterate through each hashtag and find all the tweets that match it within the start and end dates 
        hashtags_list = payload.except(:start, :end)
        tweets_array = []
        hashtags_list.each_value do |hashtag|
            tweets_array << Tweet.all.select do |tweet| 
                tweet.hashtag == hashtag && tweet.date.to_i > start_date && tweet.date.to_i < end_date
            end 
        end 
        render json: tweets_array 
    end
end

