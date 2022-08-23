class Expense < ApplicationRecord
  validates :category, presence: true, length: {minimum:4, maximum:100}
  validates :cost, presence: true, numericality: { greater_than: 1 }
  belongs_to :user
end
