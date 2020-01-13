class FlightsController < ApplicationController
  def show
    @flight = Flight.find(params[:flight_id])
  end

  def create
    passenger = Passenger.find(params[:passenger_id])
    flight = Flight.where(number: params[:number])
    passenger.flights << flight
    redirect_to "/passengers/#{passenger.id}"
  end
end
