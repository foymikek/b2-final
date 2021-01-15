require 'rails_helper'

RSpec.describe Doctor, type: :model do
  describe 'relationships' do
    it { should belong_to :hospital }
    it { should have_many :doctor_surgeries }
    it { should have_many(:surgeries).through(:doctor_surgeries) }
  end

  describe 'model methods' do
    it "can search doctor by name" do
      hospital_1 = Hospital.create(name: "Angel Hospice")
      doctor_1 = hospital_1.doctors.create(name: "Jase", specialty: "General Surgery", university: "Vic Uni")
      hospital_1.doctors.create(name: "Jenna", specialty: "General Surgery", university: "Vic Uni")

      expect(Doctor.search_by_name("Jase")).to eq(doctor_1)
    end
  end
end
