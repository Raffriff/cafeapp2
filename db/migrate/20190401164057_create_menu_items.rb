class CreateMenuItems < ActiveRecord::Migration
  def change
    create_table :menu_items do |t|
      t.string :product
      t.string :description
      t.decimal :price

      t.timestamps null: false
    end
  end
end
