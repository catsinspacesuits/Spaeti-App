class CreateStores < ActiveRecord::Migration[5.1]
  def change
    create_table :stores do |t|
      t.string :name
      t.string :address
      t.integer :beer_cost
      t.integer :cig_cost
      t.text :facilities

      t.timestamps
    end
  end
end
