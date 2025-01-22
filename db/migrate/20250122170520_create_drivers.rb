class CreateDrivers < ActiveRecord::Migration[8.0]
  def change
    create_table :drivers do |t|
      t.string :name
      t.string :license_number
      t.string :phone
      t.references :car, null: false, foreign_key: true

      t.timestamps
    end
  end
end
