require 'rails_helper'

RSpec.describe Surgery, type: :feature do
  describe 'When I visit the Surgery index page' do
    it "I can see the title of all surgeries and for each surgery I see the names of all doctors performing that surgery" do
      surgery_1 = Surgery.create(title: "Surgery 1", day_of_the_week: "Monday", operating_room_number: 1)
      surgery_2 = Surgery.create(title: "Surgery 2", day_of_the_week: "Tuesday", operating_room_number: 2)
      hospital_1 = Hospital.create(name: "Angel Hospice")
      doctor_1 = hospital_1.doctors.create(name: "Jase", specialty: "General Surgery", university: "Vic Uni")
      doctor_2 = hospital_1.doctors.create(name: "Jenna", specialty: "Pediatric Surgery", university: "Otago Uni")
      doctor_3 = hospital_1.doctors.create(name: "David", specialty: "General Surgery", university: "AKL Uni")
      doctor_4 = hospital_1.doctors.create(name: "Angela", specialty: "Attending Surgeon", university: "Otago Uni")
      DoctorSurgery.create(doctor_id: doctor_1.id, surgery_id: surgery_1.id)
      DoctorSurgery.create(doctor_id: doctor_2.id, surgery_id: surgery_1.id)
      DoctorSurgery.create(doctor_id: doctor_3.id, surgery_id: surgery_2.id)
      DoctorSurgery.create(doctor_id: doctor_4.id, surgery_id: surgery_2.id)
      # As a visitor
      # When I visit a surgery’s index page (‘/surgeries’)
      visit surgeries_path
      # I see the title of all surgeries
      # And for each surgery I see the names of all doctors performing that surgery
      within "#surgery-#{surgery_1.id}" do
        expect(page).to have_content(surgery_1.title)
        expect(page).to have_content(doctor_1.name)
        expect(page).to have_content(doctor_2.name)
      end

      within "#surgery-#{surgery_2.id}" do
        expect(page).to have_content(surgery_2.title)
        expect(page).to have_content(doctor_3.name)
        expect(page).to have_content(doctor_4.name)
      end
    end
  end
end
