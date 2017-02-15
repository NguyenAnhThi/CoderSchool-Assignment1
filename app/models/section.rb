class Section < ApplicationRecord
	has_many :food_items, dependent: :destroy
	def to_s
		name
	end
end
