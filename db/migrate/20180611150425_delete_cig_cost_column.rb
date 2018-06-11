class DeleteCigCostColumn < ActiveRecord::Migration[5.1]
  def change
  	remove_column :stores, :cig_cost, :integer
  end
end
