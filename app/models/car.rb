class Car < ApplicationRecord
  has_one :driver, dependent: :destroy
  has_one :ride, dependent: :destroy

  validates :brand, presence: true, format: { with: /\A[a-zA-Zа-яА-Я\s]+\z/, message: 'Марка должна содержать только буквы и пробелы' }
  validates :model, presence: true, format: { with: /\A[a-zA-Zа-яА-Я0-9\s]+\z/, message: 'Модель должна содержать только буквы, цифры и пробелы' }
  validates :plate_number, presence: true, format: { with: /\A[A-Z0-9-]+\z/i, message: 'Номерной знак должен содержать только буквы, цифры и дефисы' }
  validates :year, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1886, less_than_or_equal_to: Date.today.year, message: 'Год должен быть валидным числом между 1886 и текущим годом' }
end
