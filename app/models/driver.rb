class Driver < ApplicationRecord
  has_one_attached :photo
  validates :name, presence: true, format: { with: /\A[a-zA-Zа-яА-Я\s]+\z/, message: 'Имя должно содержать только буквы и пробелы' }
  validates :phone, presence: true, format: { with: /\A\+?\d{10,15}\z/, message: 'Номер телефона должен содержать от 10 до 15 цифр' }
  validates :license_number, presence: true, format: { with: /\A[A-Z0-9-]+\z/i, message: 'Водительское удостоверение должно содержать только буквы, цифры и дефисы' }
end

