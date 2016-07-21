class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.float :price
      t.string :code
      t.integer :company_id

      t.timestamps null: false
    end
  end
end
