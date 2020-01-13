require 'rails_helper'

RSpec.describe "passenger show page" do
  it "I see the following information:
  - that passenger's name
  - a section that displays all flight numbers of the flights for that passenger
  - all flight numbers listed link to that flight's show page" do

    southwest = Airline.create(name: "Southwest")

    southwest_1 = southwest.flights.create(number: "SW1", date: "10/10/20", time: "1300", departure_city: "Minneapolis", arrival_city: "Nashville")
    southwest_2 = southwest.flights.create(number: "SW2", date: "10/11/20", time: "1500", departure_city: "Nashville", arrival_city: "Minneapolis")
    southwest_3 = southwest.flights.create(number: "SW3", date: "10/12/20", time: "1600", departure_city: "Minneapolis", arrival_city: "Houston")
    southwest_4 = southwest.flights.create(number: "SW4", date: "10/13/20", time: "1700", departure_city: "Houston", arrival_city: "Denver")

    mike = Passenger.create!(name: "Mike Dao", age: 30)

    FlightPassenger.create!(flight: southwest_1, passenger: mike)
    FlightPassenger.create!(flight: southwest_2, passenger: mike)
    FlightPassenger.create!(flight: southwest_3, passenger: mike)
    FlightPassenger.create!(flight: southwest_4, passenger: mike)

    visit "/passengers/#{mike.id}"

    expect(page).to have_content(mike.name)

    within "#flight-numbers" do
      expect(page).to have_link(southwest_1.number)
      expect(page).to have_link(southwest_2.number)
      expect(page).to have_link(southwest_3.number)
      click_link(southwest_4.number)
    end

    expect(current_path).to eq("/flights/#{southwest_4.id}")
  end
end
