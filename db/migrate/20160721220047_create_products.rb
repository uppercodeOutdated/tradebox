class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.float  :price
      t.string :code, limit: 20

      t.timestamps null: false
    end
  end
end
