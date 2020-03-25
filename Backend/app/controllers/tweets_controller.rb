class TweetsController < ApplicationController
   
    def create   
        # Get basic information from the parameters 
        payload = params[:payload]
        start_date = payload[:start].to_i
        end_date = payload[:end].to_i 
        hashtags_list = payload.except(:start, :end)
        # Iterate through each hashtag and find all the tweets that match it within the start and end dates
        tweets_array = []
        hashtags_list.each_value do |hashtag|
            tweets_array << Tweet.all.select do |tweet| 
                tweet.hashtag == hashtag && tweet.date.to_i >= start_date && tweet.date.to_i <= end_date
            end 
        end 
        # Grab the number of times a tweet occured for each date and hashtag
        tweets_count_by_date_by_hashtag = {}
        tweets_array.each do |tweet_collection| 
            get_date_count_from_tweets(tweet_collection, tweets_count_by_date_by_hashtag, start_date, end_date)
        end 
        # Return the count to the website 
        render json: tweets_count_by_date_by_hashtag
    end

    private 

    def get_date_count_from_tweets(tweet_collection, tweets_count_by_date_by_hashtag, start_date, end_date) 
        # Create a key and empty value for this hashtag in the results hash
        current_hashtag = "#{tweet_collection[0].hashtag}"
        tweets_count_by_date_by_hashtag[current_hashtag] = {}
        tweets_count_by_date = tweets_count_by_date_by_hashtag[current_hashtag]
        # Create a date array based on the start and end dates
        date_array = []
        while start_date <= end_date do
            date_array << start_date 
            start_date += 1 
        end 
        # Assign the tweets_count_by_date hash keys based on the date array
        date_array.each do |date| 
            tweets_count_by_date["#{date}"] = [] 
        end 
        # Count the number of tweets for each date and put them in the results hash
        tweets_count_by_date.each_key do |key| 
            # Get all the tweets for that date
            all_tweets_on_date = tweet_collection.select do |tweet|
                tweet.date == key  
            end 
            # Count the number of tweets for that date
            count = all_tweets_on_date.length 
            # Assign the count number as the value to the appropriate date 
            tweets_count_by_date[key] = count
        end 
    end 

end
