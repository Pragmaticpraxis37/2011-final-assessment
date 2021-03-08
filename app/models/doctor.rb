class Doctor < ApplicationRecord
  has_many :doctor_surgeries
  has_many :surgeries, through: :doctor_surgeries

  def self.years_practicing
    order(years_practiced: :desc)
  end
end
