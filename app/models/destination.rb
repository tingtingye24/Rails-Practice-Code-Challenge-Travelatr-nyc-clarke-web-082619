class Destination < ApplicationRecord
    has_many :posts
    has_many :bloggers, through: :posts
    
    validates :name, :country, presence: true

    def name_and_country
        "#{name} #{country}"
    end
    
    def top_5_liked
        
    end

end
