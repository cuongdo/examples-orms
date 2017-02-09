class Order < ApplicationRecord
  validates :subtotal, presence: true

  belongs_to :customer

  has_many :line_items
  has_many :products, :through => :line_items
end
