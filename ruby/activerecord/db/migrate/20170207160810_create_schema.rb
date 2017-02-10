class CreateSchema < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name, null: false

      t.timestamps null: false
    end

    create_table :products do |t|
      t.string :name, null: false
      t.decimal :price, precision: 18, scale: 2, null: false

      t.timestamps null: false
    end

    create_table :orders do |t|
      t.decimal :subtotal, precision: 18, scale: 2, null: false
      t.belongs_to :customer, index: true, null: false

      t.timestamps null: false
    end

    add_foreign_key :orders, :customers

    create_table :line_items do |t|
      t.belongs_to :order, index: true, null: false
      t.belongs_to :product, index: true, null: false

      t.timestamps null: false
    end

    # Deleting an order deletes its line items
    add_foreign_key :line_items, :orders, on_delete: :cascade
    # Deleting a product shouldn't delete its line items
    add_foreign_key :line_items, :products
  end
end
