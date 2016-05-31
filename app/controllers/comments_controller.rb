class CommentsController < ApplicationController
    def create
        @post = Post.find params[:post_id]
        @comment = @post.comments.create(comment_params)
        if @post.save
            redirect_to post_path(@post)
        else
            render plain: @post.errors.messages
        end
    end

    private

    def comment_params
        params.require(:comment).permit(:name, :email, :message)
    end

end
