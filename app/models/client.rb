class Client < ApplicationRecord
  has_many :rides, dependent: :destroy

  validates :name, presence: true, format: { with: /\A[a-zA-Zа-яА-Я\s]+\z/, message: 'Имя должно содержать только буквы и пробелы' }
  validates :phone, presence: true, format: { with: /\A\+?\d{10,15}\z/, message: 'Номер телефона должен содержать от 10 до 15 цифр и может включать + в начале' }
end
