class Order < ActiveRecord::Base
  has_many :items
  has_many :products, through: :items

  default_scope { where(closed: false).order(:id) }


  validates :name, presence: true
  validates :items, presence: true

  accepts_nested_attributes_for :items, reject_if: :check_quantity

  def check_quantity(item)
    item['quantity'].nil? or item['quantity'].to_i == 0
  end

  def close
    self.update_column(:closed, true)
  end
end
