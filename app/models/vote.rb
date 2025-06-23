class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :kokonina

  validates :value, inclusion: { in: [ -1, 0, 1 ] }
  # Validace na úrovni modelu, která doplňuje unikátní index v databázi
  validates :user_id, uniqueness: { scope: :kokonina_id, message: "může hlasovat jen jednou" }
end
