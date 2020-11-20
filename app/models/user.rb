class User < ApplicationRecord
    has_secure_password
    has_many :movies, through: :favorites
    has_many :follower_follows, foreign_key: :followed_id, class_name: "Friendship"
    has_many :followers, through: :follower_follows, source: :follower 
    has_many :followed_fallowers, foreign_key: :follower_id, class_name: "Friendship"
    has_many :following, through: :followed_fallowers, source: :followed
    validates :name, presence: :true
    validates :email, presence: :true
    validates :username, uniqueness: :true
    validates :password, length: {in: 6..20}
end
