class CreateRestaurants < ActiveRecord::Migration[6.0]
  def change
    create_table :restaurants do |t|
      t.string :name, null: false
      t.integer :opening, null: false
      t.integer :closing, null: false
    end
  end
end
