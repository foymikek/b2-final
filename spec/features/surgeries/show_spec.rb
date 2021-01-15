require 'rails_helper'

RSpec.describe Surgery, type: :feature do
  describe 'When I visit a Surgeries show page' do
    it "I can add a doctor to the surgery and can see the addition" do
      surgery_1 = Surgery.create(title: "Surgery 1", day_of_the_week: "Monday", operating_room_number: 1)
      hospital_1 = Hospital.create(name: "Angel Hospice")
      doctor_1 = hospital_1.doctors.create(name: "Jase", specialty: "General Surgery", university: "Vic Uni")
# User Story 3, Add a Doctor to a Surgery
# As a visitor
# When I visit a surgery's show page
      visit surgery_path(surgery_1.id)
      save_and_open_page
# I see a field with instructions to "Add A Doctor To This Surgery"
      fill_in :"Add A Doctor To This Surgery", with: "Jase"
      click_button "Submit"

      new_surgery_doctor = SurgeryDoctor.last

      expect(new_surgery_doctor.doctor_id).to eq(doctor_1.id)
      expect(new_surgery_doctor.surgery_id).to eq(surgery_id.id)
      expect(current_path).to eq(surgery_path(surgery_1.id))

      expect(page).to have_content(doctor_1.name)
# When I input the name of an existing Doctor into that field
# And I click submit
# I'm taken back to that surgery's show page
# And I see the name of that doctor listed on the page
# (Note: you do not need to handle any sad paths)
    end
  end
end
