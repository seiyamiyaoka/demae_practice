class Order < ApplicationRecord
  has_many :order_foods
  belongs_to :user
  has_one :order_information
end
