class DoctorSurgeriesController < ApplicationController
  def create
    added_doctor = Doctor.find_by(name: params[:query])
    DoctorSurgery.create(doctor_id: [])
    DoctorSurgery.create!(doctor_id:added_doctor.id, surgery_id: params[:format])
    redirect_to surgery_path(params[:format])
  end
end
