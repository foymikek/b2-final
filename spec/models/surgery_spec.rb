require 'rails_helper'

RSpec.describe Surgery, type: :model do
  describe 'relationships' do
    it { should have_many :doctor_surgeries }
    it { should have_many(:doctors).through(:doctor_surgeries) }
  end
  describe 'model methods' do
    it "can output surgeries performed on the same day of the week" do
      Surgery.create(title: "Surgery 1", day_of_the_week: "Monday", operating_room_number: 1)
      Surgery.create(title: "Surgery 2", day_of_the_week: "Tuesday", operating_room_number: 2)
      Surgery.create(title: "Surgery 3", day_of_the_week: "Tuesday", operating_room_number: 3)
      Surgery.create(title: "Surgery 4", day_of_the_week: "Tuesday", operating_room_number: 4)
      Surgery.create(title: "Surgery 5", day_of_the_week: "Tuesday", operating_room_number: 4)

      expect(Surgery.same_day_surgeries(surgery_5)).to eq(["Surgery 2", "Surgery 3", "Surgery 4", "Surgery 5"])
    end
  end
end
