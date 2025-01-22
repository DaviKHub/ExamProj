class CreateCars < ActiveRecord::Migration[8.0]
  def change
    create_table :cars do |t|
      t.string :brand
      t.string :model
      t.string :plate_number
      t.string :year
      t.boolean :status

      t.timestamps
    end
  end
end
