class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.time :pickUpTime
      t.decimal :totalPrice
      t.references :profile, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
