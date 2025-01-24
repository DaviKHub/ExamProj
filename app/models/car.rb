class Car < ApplicationRecord
  has_one :driver, dependent: :destroy
  has_one :ride, dependent: :destroy

  validates :brand,
            presence: true,
            format: { with: /\A[a-zA-Zа-яА-Я\s]+\z/, message: 'Марка должна содержать только буквы и пробелы' }

  validates :model,
            presence: true,
            format: { with: /\A[a-zA-Zа-яА-Я0-9\s]+\z/, message: 'Модель должна содержать только буквы, цифры и пробелы' }

  validates :plate_number,
            presence: true,
            uniqueness: { case_sensitive: false },
            format: {
              with: /\A[АВЕКМНОРСТУХ]{1}\d{3}[АВЕКМНОРСТУХ]{2}\d{2,3}\z/,
              message: 'Номерной знак должен соответствовать российскому стандарту: одна буква, три цифры, две буквы, регион (2-3 цифры) и быть уникальным'
            }
  validates :year,
            presence: true,
            format: {
              with: /\A(19[8-9][0-9]|20[0-2][0-9]|#{Date.today.year})\z/,
              message: 'Год должен быть в пределах от 1980 до текущего года'
            }
end
