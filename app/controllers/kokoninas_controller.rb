class KokoninasController < ApplicationController
  # before_action calls the require_user method before ":new" and ":create" actions.
  # require_user is defined in ApplicationController. It checks if a user is signed in.
  before_action :require_user, only: [ :new, :create ]

  # Shows a list of all kokoninas, sorted by score from highest to lowest.
  def index
    # This block tells sort_by to use the score of each kokonina for sorting.
    @kokoninas = Kokonina.all.sort_by do |k|
      k.score
    end.reverse
  end

  # Shows details for one kokonina. Uses params[:id] from the URL.
  def show
    @kokonina = Kokonina.find(params[:id])
  end

  # Shows a form to create a new kokonina.
  def new
    @kokonina = Kokonina.new
  end

  # Creates a new kokonina with data from the form.
  # Uses current_user from ApplicationController to set the owner.
  def create
    # This creates a new Kokonina object linked to the current user, but does not save it to the database yet.
    @kokonina = current_user.kokoninas.build(kokonina_params)

    # This line calls save and tries to store the new kokonina in the database.
    # Then the if statement checks if save was successful (returns true or false).
    if @kokonina.save
      redirect_to @kokonina, notice: "Kokonina byla úspěšně vytvořena."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # Deletes a kokonina by id and redirects to the list.
  def destroy
    @kokonina = Kokonina.find(params[:id])
    @kokonina.destroy
    redirect_to kokoninas_path, notice: "Kokonina byla úspěšně smazána. Můžete přidat další :)"
  end

  private

  # This method makes sure only title and description can be set from the form.
  # It protects the app from users sending unwanted or dangerous data.
  def kokonina_params
    params.require(:kokonina).permit(:title, :description)
  end
end
