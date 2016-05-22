class Author < ActiveRecord::Base
    has_many :posts
    
    validates :name, presence: true
    validates :link, :format => URI::regexp(%w(http https))
end
