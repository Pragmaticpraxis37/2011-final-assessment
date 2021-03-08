require "rails_helper"

describe Surgery, type: :model do
  describe "relationships" do
    it {should have_many(:doctor_surgeries)}
    it {should have_many(:doctors).through(:doctor_surgeries)}
  end

  describe "model methods" do
    before :each do
      @doctor_1 = Doctor.create!(name: "Doc 1", years_practiced: 5, university: "Big U")
      @doctor_2 = Doctor.create!(name: "Doc 2", years_practiced: 10, university: "Little U")
      @doctor_3 = Doctor.create!(name: "Doc 3", years_practiced: 15, university: "Middle U")
      @surgery_1 = Surgery.create!(title: "Heart", day_of_week: "Wednesday", operating_room: "1")
      @surgery_2 = @doctor_2.surgeries.create!(title: "Stomach", day_of_week: "Monday", operating_room: "3")
      @surgery_3 = @doctor_2.surgeries.create!(title: "Foot", day_of_week: "Friday", operating_room: "2")
      @surg_1_doc_1 = DoctorSurgery.create!(doctor_id:@doctor_1.id, surgery_id: @surgery_1.id)
      @surg_1_doc_2 = DoctorSurgery.create!(doctor_id:@doctor_2.id, surgery_id: @surgery_1.id)
    end

    it "#all_surgical_doctors" do
      expected = @surgery_1.all_surgical_doctors.map do |doctor|
                  doctor.name
                end

      expect(expected).to eq(["Doc 1", "Doc 2"])
    end

    it "#least_experienced_doctor" do
      expect(@surgery_1.least_experienced_doctor).to eq(5)
    end

    it "#most_experienced_doctor" do 
      expect(@surgery_1.least_experienced_doctor).to eq(10)
    end
  end
end
