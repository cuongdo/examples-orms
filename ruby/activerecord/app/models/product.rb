class Product < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true

  has_many :line_items
  has_many :orders, :through => :line_items
end
