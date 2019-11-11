class Parking < ApplicationRecord
  after_initialize :set_time

  attribute :time, :string, default: ''

  scope :get_all_by_plate, ->(plate) { where(plate: plate) }
  
  def create  
    self.enter_at = DateTime.now
    self.save
  end

  def pay
    self.paid = true unless self.paid   
    self.save
  end

  def out
    self.left_at = DateTime.now if self.left_at.nil?
    self.left = true unless self.left     
    self.save
  end

  private

  def set_time
    timeNow = Time.zone.parse(DateTime.now.to_s)
    time = ((( left_at || timeNow) - (enter_at || timeNow)) / 60).to_i
    self.time = format('%d minutes', time)
  end  
end
