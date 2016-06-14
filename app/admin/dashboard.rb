ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    # Here is an example of a simple dashboard with columns and panels.
    #
    columns do
      column do
        panel "Articles récents" do
          ul do
            Post.recent(5).map do |post|
              li do
                h4 link_to(post.title, admin_post_path(post))
                h5 post.description
              end
            end
          end
        end
      end
    end
  end
end
