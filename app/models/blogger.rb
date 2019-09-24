class Blogger < ApplicationRecord
    has_many :posts
    has_many :destinations, through: :posts

        
    validates :name, :age, :bio, presence: true
    validates :name, uniqueness: { case_sensitive: false}
    validates :age, numericality: { only_integer: true, greater_than: 0}
    validates :bio, length: {minimum: 50} 


    def total_likes
        like = self.posts.sum{|post| post.likes}
    end

    def most_liked
        self.posts.max{|post| post.likes}
    end

    def name_and_age_and_bio
        "#{name} #{age}"
    end
end
