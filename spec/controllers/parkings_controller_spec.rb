require 'rails_helper'

RSpec.describe ParkingsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Parking. As you add validations to Parking, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET #index" do
    it "returns a success response" do
      parking = Parking.create! valid_attributes
      get :index, params: {}
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      parking = Parking.create! valid_attributes
      get :show, params: {id: parking.to_param}
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Parking" do
        expect {
          post :create, params: {parking: valid_attributes}
        }.to change(Parking, :count).by(1)
      end

      it "renders a JSON response with the new parking" do
        post :create, params: {parking: valid_attributes}
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')
        expect(response.location).to eq(parking_url(Parking.last))
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the new parking" do

        post :create, params: {parking: invalid_attributes}
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested parking" do
        parking = Parking.create! valid_attributes
        put :update, params: {id: parking.to_param, parking: new_attributes}
        parking.reload
        skip("Add assertions for updated state")
      end

      it "renders a JSON response with the parking" do
        parking = Parking.create! valid_attributes

        put :update, params: {id: parking.to_param, parking: valid_attributes}
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the parking" do
        parking = Parking.create! valid_attributes

        put :update, params: {id: parking.to_param, parking: invalid_attributes}
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end
end
