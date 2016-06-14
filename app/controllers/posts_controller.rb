class PostsController < ApplicationController
    before_action :set_page_infos, only: [:index, :pager]

    ENTRIES_PER_PAGE = 5

    def index
        @posts = Post.recent(ENTRIES_PER_PAGE)
    end

    def pager
        if @page_number > 1 && @page_number <= @page_max
            @posts = Post.recent(ENTRIES_PER_PAGE).offset((@page_number - 1) * ENTRIES_PER_PAGE)
            render :index
        else
            redirect_to root_path
        end
    end

    def show
        @post = Post.find params[:id]
        @new_comment = @post.comments.build
    end

    private

    def set_page_infos
        @page_number = if params[:number].to_i > 0 then params[:number].to_i else 1 end
        @page_max = (Post.count / ENTRIES_PER_PAGE.to_f).ceil
    end
end
