class Surgery < ApplicationRecord
  has_many :doctor_surgeries
  has_many :doctors, through: :doctor_surgeries

  def all_surgical_doctors
    doctors
  end

  def least_experienced_doctor
    doctors.order(:years_practiced).limit(1)
  end

  def most_experienced_doctor
    doctors.order(years_practiced: :desc).limit(1)
  end
end
