class Street < ApplicationRecord
  has_many :houses
  def getStudentsCount
    student_count = 0
    houses = House.where(street_id: id).to_a
    houses.each do |h|
      student_count += Student.where(house_id: h.id).to_a.length
    end
    student_count
  end
end
