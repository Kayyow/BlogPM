class Comment < ActiveRecord::Base
    belongs_to :post

    validates :name, :email, :message, :post, presence: true
    validates :email, format: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
end
