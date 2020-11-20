require 'rest-client'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Movie.destroy_all

def movies
    response = RestClient.get 'https://api.themoviedb.org/3/movie/top_rated?api_key=7c52f138f088edd2d7ac5f6212bc199e'
    json = JSON.parse response
    byebug
    if !json.nil?
        json["results"].map do |movie| 
            Movie.create(title: json["title"], 
                release_date: json["release_date"], 
                genre_id: json["genre_ids"], 
                poster_path: ["poster_path"], 
                backdrop_path: ["backdrop_path"], 
                overview: ["overview"]
            )
        end
    else
        puts "error seeding Movies"
    end

end

puts movies
