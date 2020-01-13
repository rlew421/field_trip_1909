require 'rails_helper'

RSpec.describe "flight show page" do
  it "I see all of that flight's info including:
  - number
  - date
  - time
  - departure city
  - arrival city
  - name of the airline this flight belongs to
  - names of all the passengers on this flight" do

    southwest = Airline.create(name: "Southwest")

    southwest_1 = southwest.flights.create(number: "SW1", date: "10/10/20", time: "1300", departure_city: "Minneapolis", arrival_city: "Nashville")

    passenger_1 = southwest_1.passengers.create!(name: "Mike Dao", age: 30)
    passenger_2 = southwest_1.passengers.create!(name: "Meg Stang", age: 28)
    passenger_3 = southwest_1.passengers.create!(name: "Sal Espinosa", age: 21)

    visit "/flights/#{southwest_1.id}"

    expect(page).to have_content("Flight Number: #{southwest_1.number}")
    expect(page).to have_content("Flight Date: #{southwest_1.date}")
    expect(page).to have_content("Flight Time: #{southwest_1.time}")
    expect(page).to have_content("Flight Departure City: #{southwest_1.departure_city}")
    expect(page).to have_content("Flight Arrival City: #{southwest_1.arrival_city}")
    expect(page).to have_content("Belongs to #{southwest.name} Airline")

    within "#passengers" do
      expect(page).to have_content(passenger_1.name)
      expect(page).to have_content(passenger_2.name)
      expect(page).to have_content(passenger_3.name)
    end
  end

  it "I see the number of minors and the number of adults on the flight" do
    southwest = Airline.create(name: "Southwest")

    southwest_1 = southwest.flights.create(number: "SW1", date: "10/10/20", time: "1300", departure_city: "Minneapolis", arrival_city: "Nashville")

    passenger_1 = southwest_1.passengers.create!(name: "Mike Dao", age: 5)
    passenger_2 = southwest_1.passengers.create!(name: "Meg Stang", age: 25)
    passenger_3 = southwest_1.passengers.create!(name: "Sal Espinosa", age: 17)
    passenger_4 = southwest_1.passengers.create!(name: "Megan McMahon", age: 18)
    passenger_5 = southwest_1.passengers.create!(name: "Ian Douglas", age: 32)

    visit "/flights/#{southwest_1.id}"
    
    expect(page).to have_content("Number of Minors: 2")
    expect(page).to have_content("Number of Adults: 3")
  end
end
