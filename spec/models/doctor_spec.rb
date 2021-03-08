require "rails_helper"

describe Doctor, type: :model do
   describe "relationships" do
      it {should have_many(:doctor_surgeries)}
      it {should have_many(:surgeries).through(:doctor_surgeries)}
   end

  describe "model methods" do
    before :each do
      @doctor_1 = Doctor.create!(name: "Doc 1", years_practiced: 5, university: "Big U")
      @doctor_2 = Doctor.create!(name: "Doc 2", years_practiced: 10, university: "Little U")
      @doctor_3 = Doctor.create!(name: "Doc 3", years_practiced: 15, university: "Middle U")
    end

    it "#years_practicing" do
      expected = Doctor.years_practicing.map do |doctor|
                  doctor.years_practiced
                end

      expect(expected).to eq([15, 10, 5])
    end
  end
end
