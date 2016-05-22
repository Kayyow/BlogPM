module ApplicationHelper
    def title(text)
        content_for :title, text      
    end

    def header_image(image)
        content_for :cover_image, image
    end

    def site_heading(title, description = nil)
        content_for :heading, render(partial: 'site_heading', locals: { header_title: title, header_description: description })
    end

    def post_heading(post)
        content_for :heading, render(partial: 'post_heading', locals: { post: post })
    end
end
