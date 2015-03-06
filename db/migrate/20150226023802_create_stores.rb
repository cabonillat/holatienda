class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string :address
      t.string :telephone
      t.integer :num_employees

      t.timestamps null: false
    end
  end
end
