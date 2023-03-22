class Product < ApplicationRecord
  belongs_to :category

  scope :available, -> (min = 1) { where('stock >= ?', min) }
  scope :order_by_price, -> { order ('price ASC') }

  scope :available_and_order_by_price, -> { available.order_by_price }
end
