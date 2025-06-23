class Kokonina < ApplicationRecord
  belongs_to :author, class_name: "User"
  has_many :votes, dependent: :destroy

  validates :title, presence: true
  validates :description, presence: true

  # Metoda pro výpočet celkového skóre
  def score
    votes.sum(:value)
  end
end
