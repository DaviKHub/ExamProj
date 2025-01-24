class Client < ApplicationRecord
  has_many :rides, dependent: :destroy

  validates :name,
            length: { maximum: 50, message: 'Имя не должно превышать 50 символов' }

  validates :phone,
            uniqueness: { scope: :name, message: 'Уже есть клиент с таким номером телефона' }
end
