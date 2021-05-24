class Item < ApplicationRecord
  has_many :items
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtentions
  belongs_to :category, :condition, :delivery_fee, :delivery_area, :delivery_date

  def add_tax_price
    (self.price * 1.10).round
  end

  validates :name, presence: true
  validates :description, presence: true
  validates :category_id, numericality: { other_than: 1 }, presence: true
  validates :condition_id, numericality: { other_than: 1 }, presence: true
  validates :price, presence: true
  validates :delivery_fee_id, numericality: { other_than: 1 }, presence: true
  validates :delivery_area_id, numericality: { other_than: 1 }, presence: true
  validates :delivery_date_id, numericality: { other_than: 1 }, presence: true
end
