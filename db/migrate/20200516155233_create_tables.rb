class CreateTables < ActiveRecord::Migration[6.0]
  def change
    create_table :tables do |t|
      t.integer :restaurant_id, null: false
      t.string :name
    end
  end
end
