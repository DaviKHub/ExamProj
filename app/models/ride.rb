class Ride < ApplicationRecord
  belongs_to :client
  belongs_to :car
  validates :pickup_location, :dropoff_location, :fare, :status, presence: true
end
