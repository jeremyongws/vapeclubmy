class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.decimal :total, precision: 12, scale: 3
      t.references :user, index: true, foreign_key: true
      t.shipping_address :string
      t.phone_number :string
      t.tracking_num :string
      t.timestamps null: false
    end
  end
end
