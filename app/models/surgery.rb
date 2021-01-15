class Surgery < ApplicationRecord
  has_many :doctor_surgeries
  has_many :doctors, through: :doctor_surgeries

  def self.same_day_surgeries(surgery_arg)
    Surgery.where(day_of_the_week: "#{surgery_arg.day_of_the_week}").pluck(:title)
  end

end
