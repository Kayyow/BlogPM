class CommentsController < ApplicationController
    def create
        @post = Post.find params[:post_id]
        @new_comment = @post.comments.create(comment_params)
        if @new_comment.valid?
            @post.save
            redirect_to post_path(@post, anchor: 'comments')
        else
            render 'posts/show'
        end
    end

    private

    def comment_params
        params.require(:comment).permit(:name, :email, :message)
    end

end
