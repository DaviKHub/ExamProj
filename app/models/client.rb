class Client < ApplicationRecord
  has_many :rides
  validates :name, :phone, presence: true
end
