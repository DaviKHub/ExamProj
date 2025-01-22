class CreateRides < ActiveRecord::Migration[8.0]
  def change
    create_table :rides do |t|
      t.references :client, null: false, foreign_key: true
      t.references :car, null: false, foreign_key: true
      t.text :pickup_location
      t.text :dropoff_location
      t.string :fare
      t.string :status
      t.timestamps
    end
  end
end
