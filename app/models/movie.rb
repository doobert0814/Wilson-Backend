class Movie < ApplicationRecord
    has_many :users, through: :favorites
end
