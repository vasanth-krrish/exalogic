class SessionsController < Devise::SessionsController
  def create
    super
    if current_user.has_role?(:admin)
      flash[:notice] = "You've logged in as admin"
    end
  end
end
