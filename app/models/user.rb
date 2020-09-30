class User < ApplicationRecord
    validates :name, {presence:true}
    validates :email,{presence:true, uniqueness:true}
    validates :password,{presence: true}
    validates :telephoneNumber, numericality: {only_integer: true}

    has_many :posts, dependent: :destroy
end
