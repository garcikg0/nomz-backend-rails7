class User < ApplicationRecord
    has_secure_password

    validates :email, presence: true, uniqueness: true

    has_many :kitchens
    has_many :ingredients, through: :kitchens
    has_many :recipes
    has_many :search_results
end
