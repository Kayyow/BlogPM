class PostsController < ApplicationController
    def index
        @posts = Post.all.order(created_at: :desc).take(5)
    end

    def show
        @post = Post.find params[:id]
    end
end
