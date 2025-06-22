# There are defined all routes for the application.
# It tells Rails how to connect URLs to controller actions.
Rails.application.routes.draw do
  # Sets the homepage to the list of kokoninas
  root "kokoninas#index"

  # Main resources for kokoninas and nested votes
  resources :kokoninas, only: [ :index, :show, :new, :create, :destroy ] do
    # Votes are always for one specific kokonina
    resources :votes, only: [ :create ]
  end

  # GET: This route displays the user selection page.
  get "select_user", to: "sessions#new"
  # POST: This route sends the selected user to the server to log in.
  post "select_user", to: "sessions#create"
  # DELETE: This route logs out the user.
  delete "logout", to: "sessions#destroy"
end
