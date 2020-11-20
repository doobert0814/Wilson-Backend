class Favorites < ApplicationRecord
    belongs_to :movies
    belongs_to :user
end
