class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.integer :code, null: false
      t.integer :price, default: 0
      t.integer :stock, default: 0
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
