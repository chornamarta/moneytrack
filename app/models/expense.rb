class Expense < ApplicationRecord
  validates :category, presence: true, length: {minimum:4, maximum:100}
  validates :cost, presence: true
  belongs_to :user
end
