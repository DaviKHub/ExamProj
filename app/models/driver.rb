class Driver < ApplicationRecord
  belongs_to :car, optional: true
  has_one :ride, dependent: :destroy
  has_one_attached :photo

  validates :name,
            presence: true,
            format: { with: /\A[a-zA-Zа-яА-Я\s]+\z/, message: 'Имя должно содержать только буквы и пробелы' }

  validates :phone, presence: true,
            format: { with: /\A\+?\d{10,15}\z/, message: 'Номер телефона должен содержать от 10 до 15 цифр' },
            uniqueness: true

  validates :license_number,
            uniqueness: true,
            length: { maximum: 15, message: 'Номер водительского удостоверения не должен превышать 15 символов и быть уникальным' }

end