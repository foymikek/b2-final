class Doctor < ApplicationRecord
  belongs_to :hospital
  has_many :doctor_surgeries
  has_many :surgeries, through: :doctor_surgeries

  def self.search_by_name(name_arg)
    find_by(name: name_arg)
  end
end
