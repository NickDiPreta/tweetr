class Tweet < ApplicationRecord
    validates :title, :content, :author, presence:  true 
    has_many :replies
end