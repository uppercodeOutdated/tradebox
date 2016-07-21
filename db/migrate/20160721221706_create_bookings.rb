class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.string :name
      t.integer :product_id
      t.integer :quantity
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
