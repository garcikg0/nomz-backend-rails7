class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    has_secure_password
    
    validates :username, presence: :true
    validates :email, format: { with: /@/, message: "must have an @" }
end
