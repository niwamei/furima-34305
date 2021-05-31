class Item < ApplicationRecord
  has_many :items
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :condition, :delivery_fee, :delivery_area, :delivery_date

  def add_tax_price
    (self.price * 1.10).round
  end

  VALID_PRICEL_REJEX = /\A[0-9]+\z/

  validates :name, presence: true
  validates :description, presence: true
  validates :category_id, numericality: { other_than: 1 }, presence: true
  validates :condition_id, numericality: { other_than: 1 }, presence: true
  validates :price, presence: true, format: {with: VALID_PRICEL_REJEX}, length: {minimum: 3, maxinum: 7},numericality: { only_integer: true,
    greater_than: 300, less_than: 1000000
    }
  validates :delivery_fee_id, numericality: { other_than: 1 }, presence: true
  validates :delivery_area_id, numericality: { other_than: 1 }, presence: true
  validates :delivery_date_id, numericality: { other_than: 1 }, presence: true
end
