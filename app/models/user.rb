class User < ApplicationRecord
  has_many :shopping_carts, dependent: :destroy
  has_one :shopping_cart


end
