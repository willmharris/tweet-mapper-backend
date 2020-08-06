class SearchesController < ApplicationController
    
    def create 
        new_search = Search.create(user_id: params[:user_id], hashtags: params[:hashtags], start_date: params[:start_date], end_date: params[:end_date])
        render json: new_search
    end 

    def destroy
        search = Search.all.find(params[:id])
        search.destroy
    end 
end
