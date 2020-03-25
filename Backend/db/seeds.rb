# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require 'database_cleaner/active_record'

DatabaseCleaner.strategy = :truncation
DatabaseCleaner.clean

def random_date
    date = "#{rand(2010..2020)}" 
end 

def random_hashtag
    x = rand(1..5)
    if x == 1 
        x = "hashtag1"
    elsif x == 2 
        x = "hashtag2"
    elsif x == 3
        x = "hashtag3"
    elsif x == 4
        x = "hashtag4"
    else 
        x = "hashtag5"
    end 
    return x 
end 

1000.times do 
    Tweet.create(date: random_date, hashtag: random_hashtag)
end 

User.create(name: "Will")
User.create(name: "Laura")

Search.create(user_id: 1, hashtags: "hashtag1 hashtag2", start_date: "2010", end_date: "2020")
Search.create(user_id: 1,  hashtags: "hashtag2 hashtag3", start_date: "2013", end_date: "2018")
Search.create(user_id: 2,  hashtags: "hashtag4 hashtag5", start_date: "2010", end_date: "2020")

