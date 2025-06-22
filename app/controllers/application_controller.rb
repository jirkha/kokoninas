class ApplicationController < ActionController::Base
  # Makes the following methods also available inside views (templates)
  helper_method :current_user, :user_signed_in?

  # Methods defined under it are accessible only inside the object
  private

  # Returns the current user object if user is logged in (based on session ID)
  def current_user
    # If @current_user is already set, reuse it. Otherwise, find user by ID stored in the session
    # Session is an object for storing data between requests.
    if session[:user_id] && @current_user.nil?
      @current_user = User.find_by(id: session[:user_id])
    end
    @current_user
  end

  # Checks if a user is currently logged in
  def user_signed_in?
    current_user.present?  # Returns true if current_user is not nil
  end

  # Makes sure a user is logged in before allowing an action
  def require_user
    if !user_signed_in?
      # select_user_path is a route helper defined in config/routes.rb
      redirect_to select_user_path, alert: "Nejprve je nutné se přihlásit."
    end
  end
end