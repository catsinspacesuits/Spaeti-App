class AddToiletsColumn < ActiveRecord::Migration[5.1]
  def change
  	add_column :stores, :toilet, :boolean
  end
end
