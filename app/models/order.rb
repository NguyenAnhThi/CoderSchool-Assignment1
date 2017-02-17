class Order < ApplicationRecord
  belongs_to :food_item
  validates :quantity, presence: true, numericality: true
end
