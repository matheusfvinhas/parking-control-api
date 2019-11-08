class Parking < ApplicationRecord
  scope :get_all_by_plate, ->(plate) { where(plate: plate) }
end
