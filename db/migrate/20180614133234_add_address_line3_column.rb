class AddAddressLine3Column < ActiveRecord::Migration[5.1]
  def change
  	add_column :stores, :address_line3, :string
  end
end
