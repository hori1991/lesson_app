class Post < ApplicationRecord
    validates :content, {presence: true, length:{maximum:140}}
    validates :user_id, {presence: true}

    belongs_to :user
    has_many :likes
    has_many :comments
    
    def self.search(search)
        Post.where(['content LIKE ?', "%#{search}%"])   
    end
end

