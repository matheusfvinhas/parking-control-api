require "rails_helper"

RSpec.describe ParkingsController, type: :routing do
  describe "routing" do    
    it "routes to #index" do
      expect(:get => "/parking/AAA-1234").to route_to("parkings#index")
    end
    
    it "routes to #create" do
      expect(:post => "/parking").to route_to("parkings#create")
    end

    it "routes to #pay via PUT" do
      expect(:put => "/parking/1/pay").to route_to("parkings#pay", :id => "1")
    end

    it "routes to #out via PUT" do
      expect(:put => "/parking/1/out").to route_to("parkings#out", :id => "1")
    end
  end
end
