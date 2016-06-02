class Item < ActiveRecord::Base
  belongs_to :order
  belongs_to :product

  validates :product, presence: true
end
