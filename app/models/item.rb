class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_fee
  belongs_to :delivery_area
  belongs_to :delivery_date

  VALID_PRICEL_REJEX = /\A[0-9]+\z/.freeze

  with_options presence: true do
    validates :name
    validates :description
    validates :image
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :condition_id
      validates :delivery_fee_id
      validates :delivery_area_id
      validates :delivery_date_id
    end
    with_options format: { with: VALID_PRICEL_REJEX }, length: { minimum: 3, maxinum: 7 },
                 numericality: { only_integer: true, greater_than: 299, less_than: 1_000_000 } do
      validates :price
    end
  end
end
