class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.decimal :total, precision: 12, scale: 3
      t.references :user, index: true, foreign_key: true
      t.string :shipping_address
      t.string :telephone
      t.string :tracking_num
      t.timestamps null: false
    end
  end
end
