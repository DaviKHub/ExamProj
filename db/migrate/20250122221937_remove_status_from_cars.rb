class RemoveStatusFromCars < ActiveRecord::Migration[8.0]
  def change
    remove_column :cars, :status, :boolean
  end
end
