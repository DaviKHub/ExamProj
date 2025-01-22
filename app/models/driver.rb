class Driver < ApplicationRecord
  belongs_to :car, optional: true
  validates :name, :license_number, :phone, presence: true
end
