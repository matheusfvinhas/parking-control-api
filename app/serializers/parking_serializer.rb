class ParkingSerializer < ActiveModel::Serializer
  attributes :id, :id, :plate, :time, :paid, :left, :enter_at, :left_at
end
