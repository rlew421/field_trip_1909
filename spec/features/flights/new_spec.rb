require 'rails_helper'

RSpec.describe "assign a passenger to a flight through form on passenger's show page" do
  it "I can fill out a form to add a flight for a passenger" do
    southwest = Airline.create(name: "Southwest")
    southwest_1 = southwest.flights.create(number: "SW1", date: "10/10/20", time: "1300", departure_city: "Minneapolis", arrival_city: "Nashville")
    southwest_2 = southwest.flights.create(number: "SW2", date: "10/11/20", time: "1500", departure_city: "Nashville", arrival_city: "Minneapolis")
    mike = Passenger.create!(name: "Mike Dao", age: 30)

    visit "/passengers/#{mike.id}"

    within "#flight-form" do
      fill_in :number, with: "SW1"
      click_button "Submit"
    end

    expect(current_path).to eq("/passengers/#{mike.id}")
    within '#flight-numbers' do
      expect(page).to have_content("SW1")
    end

    visit "/passengers/#{mike.id}"

    within "#flight-form" do
      fill_in :number, with: "SW2"
      click_button "Submit"
    end
    
    expect(current_path).to eq("/passengers/#{mike.id}")
    within '#flight-numbers' do
      expect(page).to have_content("SW1")
      expect(page).to have_content("SW2")
    end
  end
end
