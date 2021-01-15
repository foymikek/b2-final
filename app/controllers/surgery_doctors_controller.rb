class SurgeryDoctorsController < ApplicationController
  def create
    doctor = Doctor.search_by_name(params[:name])
    if doctor != nil
      SurgeryDoctor.create!(
        doctor_id: doctor.id,
        surgery_id: params[:surgery_id]
      )
    end
    surgery = Surgery.find(params[:surgery_id])
    redirect_to surgery_path(surgery.id)
  end
end
