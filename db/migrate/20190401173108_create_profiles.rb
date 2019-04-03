class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :firstname
      t.string :lastname
      t.integer :number
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
