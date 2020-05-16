class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.integer :user_id, null: false
      t.integer :table_id, null: false
      t.integer :start_time, null: false
      t.integer :duration, null: false
      t.timestamps
    end
  end
end
