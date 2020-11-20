class MovieController < ApplicationController

    def show
        response = RestClient.get 'https://api.themoviedb.org/3/movie/top_rated?api_key=7c52f138f088edd2d7ac5f6212bc199e'
        json = JSON.parse response
        # byebug
    end
end
