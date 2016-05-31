class Post < ActiveRecord::Base
    belongs_to :author

    validates :title, :content, :author, :cover_image, presence: true

    def previous_post
        self.class.where(['created_at < ?', created_at]).order(created_at: :desc).first
    end

    def next_post
        self.class.where(['created_at > ?', created_at]).order(created_at: :asc).first
    end
end
