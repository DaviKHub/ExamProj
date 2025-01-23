class Ride < ApplicationRecord
  belongs_to :client
  belongs_to :car

  validates :pickup_location, presence: true, format: { with: /\A[a-zA-Zа-яА-Я0-9\s,.-]+\z/, message: 'Адрес посадки должен быть валидным' }
  validates :dropoff_location, presence: true, format: { with: /\A[a-zA-Zа-яА-Я0-9\s,.-]+\z/, message: 'Адрес высадки должен быть валидным' }
  validates :fare, presence: true, numericality: { greater_than_or_equal_to: 0, message: 'Стоимость должна быть числом больше или равной нулю' }
end
