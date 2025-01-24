class Ride < ApplicationRecord
  belongs_to :client
  belongs_to :car

  validates :pickup_location,
            length: { maximum: 255, message: 'Адрес посадки не должен превышать 255 символов' }

  validates :dropoff_location,
            length: { maximum: 255, message: 'Адрес высадки не должен превышать 255 символов' }

  validates :fare,
            numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 1_000_000, message: 'Стоимость должна быть в разумных пределах (до 1 000 000)' }

  validates :pickup_location,
            uniqueness: { scope: :dropoff_location, message: 'Комбинация адреса посадки и высадки должна быть уникальной' }
end
