require 'rails_helper'

RSpec.describe ParkingsController, type: :controller do 
  let(:valid_attributes) {
    { :plate => 'AAA-1234', :enter_at => DateTime.now } 
  }

  let(:invalid_attributes) {
    { :plate => 'AAA1234', :enter_at => DateTime.now } 
  }

  describe "GET #index" do
    it "returns a success response" do
      parking = Parking.create! valid_attributes
      get :index, params: { :plate => 'AAA-1234' }
      expect(response).to be_successful
    end
  end  

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Parking" do
        expect {
          post :create, params: { parking: valid_attributes }
        }.to change(Parking, :count).by(1)
      end

      it "renders a JSON response with the new parking" do
        post :create, params: { parking: valid_attributes }
        expect(response).to have_http_status(:created)
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the new parking" do
        post :create, params: { parking: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PUT #pay" do
    it "successful pay" do
      parking = Parking.create! valid_attributes
      put :pay, params: { :id => parking.id }
      expect(response).to have_http_status(:ok)        
      expect(JSON.parse(response.body)['paid']).to be(true)
    end
  end

  describe "PUT #out" do
    context "with paid reserve" do
      it "successful out" do
        parking = Parking.create! valid_attributes
        put :pay, params: { :id => parking.id }
        put :out, params: { :id => parking.id }
        expect(response).to have_http_status(:ok)        
        expect(JSON.parse(response.body)['left']).to be(true)
      end
    end  
    
    context "with unpaid reserve" do
      it "unsuccessful out" do
        parking = Parking.create! valid_attributes
        put :out, params: { :id => parking.id }
        expect(response).to have_http_status(:unprocessable_entity)                
      end
    end 
  end
end
