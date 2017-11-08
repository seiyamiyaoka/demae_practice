class Shop < ApplicationRecord
  belongs_to :city
  has_many :shop_genres
  has_many :genres, through: :shop_genres
  has_many :foods
  # has_many :genres
end
