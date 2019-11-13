require 'rails_helper'

RSpec.describe Parking, type: :model do
    it "is valid" do
      parking = Parking.new(plate: 'AAA-1234')
      expect(parking).to be_valid
    end

    it "is not valid" do
      parking = Parking.new(plate: 'AAA1234')
      expect(parking).to_not be_valid
    end

    it "is not valid" do
      parking = Parking.new(plate: nil)
      expect(parking).to_not be_valid
    end
end
