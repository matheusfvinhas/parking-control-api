class Parking < ApplicationRecord
  validates :plate, presence: true, format: { with: /[a-zA-Z]{3}[-]{1}[0-9]{4}/, message: "plate should be formatted like XXX-0000" }, on: :create
  validate :paid_reserve, on: :update

  after_initialize :set_time

  attribute :time, :string, default: ''

  scope :get_all_by_plate, -> (plate) { where(plate: plate) }  
  
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

  def paid_reserve    
    self.errors.add(:parking, "can't leave before pay") unless self.paid
  end
end
