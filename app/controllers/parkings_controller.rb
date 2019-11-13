class ParkingsController < ApplicationController
  before_action :set_parking, only: %i[pay out]

  # GET /parking/:plate
  def index
    @parkings = Parking.get_all_by_plate(params[:plate]).order(id: :desc)
    render json: @parkings
  end

  # POST /parking
  def create
    @parking = Parking.find_by(plate: params[:plate], left: false)
        
    unless @parking.nil?   
      render json: @parking, status: :ok
      return
    end

    @parking = Parking.new(parking_params)   

    if @parking.create
      render json: @parking, status: :created
    else
      render json: @parking.errors, status: :unprocessable_entity
    end
  end

  # PUT /parking/:id/pay
  def pay
    if @parking.pay
      render json: @parking
    else
      render json: @parking.errors, status: :unprocessable_entity
    end
  end

  # PUT /parking/:id/out
  def out
    if @parking.out
      render json: @parking
    else
      render json: @parking.errors, status: :unprocessable_entity
    end
   end

  private
  
  def set_parking
    @parking = Parking.find(params[:id])
  end
  
  def parking_params
    params.require(:parking).permit(:id, :plate)
  end
end
