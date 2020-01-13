require 'rails_helper'

RSpec.describe Flight, type: :model do
  describe 'validations' do
    it {should validate_presence_of :number}
    it {should validate_presence_of :date}
    it {should validate_presence_of :time}
    it {should validate_presence_of :departure_city}
    it {should validate_presence_of :arrival_city}
  end

  describe 'relationships' do
    it {should belong_to :airline}
    it {should have_many :flight_passengers}
    it {should have_many(:passengers).through(:flight_passengers)}
  end

  describe 'instance methods' do
    it "minor_count" do
      southwest = Airline.create(name: "Southwest")

      southwest_1 = southwest.flights.create(number: "SW1", date: "10/10/20", time: "1300", departure_city: "Minneapolis", arrival_city: "Nashville")

      passenger_1 = southwest_1.passengers.create!(name: "Mike Dao", age: 5)
      passenger_2 = southwest_1.passengers.create!(name: "Meg Stang", age: 25)
      passenger_3 = southwest_1.passengers.create!(name: "Sal Espinosa", age: 17)
      passenger_4 = southwest_1.passengers.create!(name: "Megan McMahon", age: 18)
      passenger_5 = southwest_1.passengers.create!(name: "Ian Douglas", age: 32)

      expect(southwest_1.minor_count).to eq(2)
    end

    it "adult_count" do
      southwest = Airline.create(name: "Southwest")

      southwest_1 = southwest.flights.create(number: "SW1", date: "10/10/20", time: "1300", departure_city: "Minneapolis", arrival_city: "Nashville")

      passenger_1 = southwest_1.passengers.create!(name: "Mike Dao", age: 5)
      passenger_2 = southwest_1.passengers.create!(name: "Meg Stang", age: 25)
      passenger_3 = southwest_1.passengers.create!(name: "Sal Espinosa", age: 17)
      passenger_4 = southwest_1.passengers.create!(name: "Megan McMahon", age: 18)
      passenger_5 = southwest_1.passengers.create!(name: "Ian Douglas", age: 32)
      expect(southwest_1.adult_count).to eq(3)
    end
  end
end
