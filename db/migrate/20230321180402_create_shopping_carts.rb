class CreateShoppingCarts < ActiveRecord::Migration[7.0]
  def change
    create_table :shopping_carts do |t|
      t.integer :total, default: 0
      t.boolean :active, default: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
