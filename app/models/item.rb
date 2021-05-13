class Item < ApplicationRecord
  has_many :items

  validates :name, presence: true
  validates :description, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :price, presence: true
  validates :delivery_fee_id, presence: true
  validates :delivery_area_id, presence: true
  validates :delivery_date_id, presence: true
end
