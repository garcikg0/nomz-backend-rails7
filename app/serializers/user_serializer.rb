class UserSerializer < ActiveModel::Serializer
  attributes :first_name, :last_name, :username, :email, :bio
  # has_many :recipes
  # has_many :kitchens
end
