class Post < ActiveRecord::Base
  belongs_to :author

  validates :title, :content, :author, :cover_image, presence: true
end
