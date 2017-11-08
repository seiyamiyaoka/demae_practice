class Food < ApplicationRecord
  belongs_to :shop
  belongs_to :category
  has_many :order_foods
  has_many :orders, through: :order_foods
end
