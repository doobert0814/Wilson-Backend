class MovieController < ApplicationController

    API_KEY = ENV['api_key']

    def show
        response = RestClient.get 'https://api.themoviedb.org/3/movie/top_rated?api_key=#{API_KEY}'
        json = JSON.parse(response)
        render json: json 
        # byebug
    end
end
