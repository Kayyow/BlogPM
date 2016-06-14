class Post < ActiveRecord::Base
    belongs_to :author
    has_many :comments

    validates :title, :content, :cover_image, :author, presence: true

    def self.recent(n = 1)
        all.order(created_at: :desc).limit(n)
    end

    def previous_post
        self.class.where(['created_at < ?', created_at]).order(created_at: :desc).first
    end

    def next_post
        self.class.where(['created_at > ?', created_at]).order(created_at: :asc).first
    end
end
