require 'rails_helper'

RSpec.describe "Parkings", type: :request do
  describe "GET /parking:plate" do
    it "respond 200 when call index" do
      get '/parking/AAA-1234'
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /parking" do
    it "creates a reserve" do
      post '/parking', params: { :plate => 'AAA-1234' }, as: :json
      expect(response).to have_http_status(201)
    end

    it "use a open reserve" do
      post '/parking', params: { :plate => 'AAA-1234' }, as: :json
      post '/parking', params: { :plate => 'AAA-1234' }, as: :json
      expect(response).to have_http_status(200)
    end

    it "invalid plate" do
      post '/parking', params: { :plate => 'AAA1234' }, as: :json
      expect(response).to have_http_status(422)
    end
  end
end
