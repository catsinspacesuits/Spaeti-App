class ChangeDatatypeBeerCost < ActiveRecord::Migration[5.1]
  def change
  	change_column :stores, :beer_cost, :float
  end
end
