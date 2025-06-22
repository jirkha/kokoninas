class User < ApplicationRecord
  has_many :kokoninas, foreign_key: 'author_id', dependent: :destroy, inverse_of: :author
  has_many :votes, dependent: :destroy

  validates :username, presence: true, uniqueness: true, length: { minimum: 3 }
end