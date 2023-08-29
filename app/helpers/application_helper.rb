module ApplicationHelper
  def user_nav_links
    if logged_in?
      content_tag(:span, "Logged in as #{current_user.email}") +
        link_to('Logout', logout_path, method: :delete)
    else
      link_to('Login', login_path) + " | " + link_to('Register', new_user_path)
    end
  end
end
