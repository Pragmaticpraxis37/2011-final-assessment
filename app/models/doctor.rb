class Doctor < ApplicationRecord
   has_many :doctor_surgeries
   has_many :surgeries, through: :doctor_surgeries
end
