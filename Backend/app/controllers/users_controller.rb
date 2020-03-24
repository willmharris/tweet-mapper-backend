class UsersController < ApplicationController
    def index 
        user = User.find_or_create_by(name: params[:name]) 
        render json: user.to_json(
            :include => :searches
        )
    end 
end

