require 'rails_helper'

RSpec.describe "assign a passenger to a flight through form on passenger's show page" do
  it "I can fill out a form to add a flight for a passenger" do
    southwest = Airline.create(name: "Southwest")

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
  end
end

# User Story 3, Assign a Passenger to a Flight
#
# As a visitor
# When I visit a passengers show page
# I see a form to add a flight
# When I fill in the form with a flight number (assuming these will always be unique)
# And click submit
# I'm taken back to the passengers show page
# And I can see the flight number of the flight I just added
