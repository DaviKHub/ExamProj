class Car < ApplicationRecord
  has_one :driver
  validates :brand, :model, :plate_number, :year, presence: true
end
