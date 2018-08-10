class AddToiletAvailableIdToStores < ActiveRecord::Migration[5.1]
  def change
    add_column :stores, :toilet_available_id, :integer
  end
end
