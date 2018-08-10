class CreateToilets < ActiveRecord::Migration[5.1]
  def change
    create_table :toilets do |t|
      t.string :toilet_available

      t.timestamps
    end
  end
end
