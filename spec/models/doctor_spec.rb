require "rails_helper"

describe Doctor, type: :model do
   describe "relationships" do
      it {should have_many(:doctor_surgeries)}
      it {should have_many(:surgeries).through(:doctor_surgeries)}
   end
end
