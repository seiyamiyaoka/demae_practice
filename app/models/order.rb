class Order < ApplicationRecord
  belongs_to :user
  has_many :order_foods
  has_many :foods, through: :order_foods
  has_one :order_information
end
