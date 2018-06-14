class AddAddressLine2Column < ActiveRecord::Migration[5.1]
  def change
  	add_column :stores, :address_line2, :string
  end
end
