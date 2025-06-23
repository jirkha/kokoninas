class SessionsController < ApplicationController
  # Shows the user selection page.
  # Sets @users to all users (ordered by username) and prepares a new user object.
  def new
    @users = User.all.order(:username)
    @user = User.new
  end

  # Handles the form submission for selecting or creating a user.
  # Uses session (from ApplicationController) to remember the user.
  def create
    user = User.find_by(id: params[:user_id])

    user_params = params[:user]
    username = user_params[:username] if user_params

    # If no user is found and a username is given, create a new user.
    if user.nil? && username.present?
      user = User.create(username: username)
    end

    if user && user.valid?
      session[:user_id] = user.id  # session is from ApplicationController
      redirect_to root_path, notice: "Vítej! Přihlašuješ se jako #{user.username}."
    else
      flash[:alert] = "Nepodařilo se vybrat ani vytvořit uživatele. Zkus to prosím znovu."
      redirect_to select_user_path
    end
  end

  # Logs out the user by deleting user_id from session.
  # Then redirects to the user selection page.
  def destroy
    session.delete(:user_id)
    redirect_to select_user_path, notice: "Byl/a jsi odhlášen/a."
  end
end
