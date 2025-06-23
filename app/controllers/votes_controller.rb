class VotesController < ApplicationController
  # This before_action calls require_user before any action.
  # require_user is from ApplicationController and checks if a user is signed in.
  before_action :require_user

  # Creates or updates a vote for a specific kokonina by the current user.
  def create
    kokonina = Kokonina.find(params[:kokonina_id])
    # Finds an existing vote by the current user for this kokonina, or builds a new one if none exists.
    # Uses find_or_initialize_by to find an existing vote by the current user for this kokonina,
    # or builds a new one if none exists. This ensures each user can only have one vote per kokonina.
    vote = kokonina.votes.find_or_initialize_by(user: current_user)

    # Set the value of the vote from the form params
    vote.value = params[:value]

    if vote.save
      redirect_to kokonina, notice: "Děkujeme za hlas!"
    else
      # vote.errors.full_messages returns an array of error messages (e.g. ["Value is not included in the list"]).
      # to_sentence joins them into a readable string (e.g. "Value is not included in the list.").
      redirect_to kokonina, alert: "Hlas se nepodařilo uložit. #{vote.errors.full_messages.to_sentence}"
    end
  end
end
