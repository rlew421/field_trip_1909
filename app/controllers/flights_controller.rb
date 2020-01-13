class FlightsController < ApplicationController
  def show
    @flight = Flight.find(params[:flight_id])
  end

  def create
    passenger = Passenger.find(params[:passenger_id])
    flight = passenger.flights.create(flight_params)
    redirect_to "/passengers/#{passenger.id}"
  end

  private

  def flight_params
    params.permit(:number)
  end
end
