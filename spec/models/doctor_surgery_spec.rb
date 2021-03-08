require "rails_helper"

describe DoctorSurgery, type: :model do
   describe "relationships" do
      it {should belong_to(:doctor)}
      it {should belong_to(:surgery)}
   end
end
