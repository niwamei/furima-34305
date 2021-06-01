class AddDeliveryDateIdToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :delivery_date_id, :integer, null: false
  end
end
