class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address, :building, :phone_number, :purchase_history_id, :user_id, :item_id, :token

  with_options presence: true do
    validates :city
    validates :address
    validates :user_id
    validates :item_id
    validates :token
    with_options format: { with: /\A[0-9]{3}-[0-9]{4}\z/ } do
      validates :postal_code
    end
    with_options numericality: { other_than: 1 } do
      validates :prefecture_id
    end
    with_options length: { maximum: 11 } do
      validates :phone_number
    end
  end

  def save
    purchase_history = PurchaseHistory.create(user_id: user_id, item_id: item_id)
    DeliveryAddress.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building: building, phone_number: phone_number, purchase_history_id: purchase_history.id)
  end
end
