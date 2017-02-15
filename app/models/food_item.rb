class FoodItem < ApplicationRecord
  belongs_to :section
  validates :name, :price, presence: true

  def image_url_or_default
  	image_url.presence || "http://larics.fer.hr/wp-content/uploads/2016/04/default-placeholder.png"
  end
end
