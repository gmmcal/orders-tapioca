class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :name
      t.text :observations
      t.boolean :closed, default: false

      t.timestamps null: false
    end
  end
end
