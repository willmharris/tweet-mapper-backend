class SearchesController < ApplicationController
    
    def create 
        Search.create(user_id: params[:user_id], hashtags: params[:hashtags])
    end 

    def destroy
        search = Search.all.find(params[:id])
        search.destroy
    end 
end
