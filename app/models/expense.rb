class Expense < ApplicationRecord
  before_save { self.category = category.downcase }
  validates :category, presence: true, length: {minimum:4, maximum:100}
  validates :cost, presence: true, numericality: { greater_than: 1 }
  belongs_to :user
end
