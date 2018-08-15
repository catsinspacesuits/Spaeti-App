class AddToiletAvailableToStores < ActiveRecord::Migration[5.1]
  def change
    add_column :stores, :toilet_available, :string
  end
end
