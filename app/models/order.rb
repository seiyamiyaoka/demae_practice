class Order < ApplicationRecord
  belongs_to :user
  has_one :order_information
  has_many :order_foods
  has_many :foods, through: :order_foods
end
