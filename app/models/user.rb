class User < ApplicationRecord
  attr_accessor :age
  attribute_method_prefix 'clear_'
  # define_attribute_methods :age

  has_many :orders
  validates :name, presence: true

  def clear_attribute(attr)
    send("#{attr}=", nil)
  end
end
