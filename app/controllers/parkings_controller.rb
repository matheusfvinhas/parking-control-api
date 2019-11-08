# frozen_string_literal: true

class ParkingsController < ApplicationController
  before_action :set_parking, only: %i[show update]

  # GET /parking/:plate
  def index
    @parkings = Parking.get_all_by_plate(params[:plate]).order(id: :desc)
    render json: @parkings
  end

  # POST /parking
  def create
    @parking = Parking.new(parking_params)
    byebug

    if @parking.save
      render json: @parking, status: :created
    else
      render json: @parking.errors, status: :unprocessable_entity
    end
  end

  # PUT /parking/:id/pay
  def pay
    byebug
    if @parking.update(parking_params)
      render json: @parking
    else
      render json: @parking.errors, status: :unprocessable_entity
    end
  end

  # PUT /parking/:id/out
  def out
    if @parking.update(parking_params)
      render json: @parking
    else
      render json: @parking.errors, status: :unprocessable_entity
    end
   end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_parking
        @parking = Parking.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def parking_params
        params.require(:parking).permit(:id, :plate)
    end
end
