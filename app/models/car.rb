class Car < ApplicationRecord
  has_one :driver
  has_many :rides
  validates :brand, :model, :plate_number, :year, presence: true
end
