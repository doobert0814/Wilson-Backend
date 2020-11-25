class MovieController < ApplicationController

    API_KEY = ENV['API_KEY']

    def index
        response = RestClient.get "https://api.themoviedb.org/3/movie/top_rated?api_key=#{API_KEY}"
        json = JSON.parse(response)
        render json: json 
    end
end
