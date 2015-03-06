class CreatePromos < ActiveRecord::Migration
  def change
    create_table :promos do |t|
      t.string :title
      t.text :content
      t.references :product
      t.date :start_date
      t.date :finish_date
      t.integer :discount

      t.timestamps null: false
    end
  end
end
