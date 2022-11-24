class House < ApplicationRecord
  has_many :students
  belongs_to :street
end
