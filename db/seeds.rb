# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

southwest = Airline.create(name: "Southwest")
southwest_1 = southwest.flights.create(number: "SW1", date: "10/10/20", time: "1300", departure_city: "Minneapolis", arrival_city: "Nashville")
southwest_2 = southwest.flights.create(number: "SW2", date: "10/11/20", time: "1500", departure_city: "Nashville", arrival_city: "Minneapolis")
mike = Passenger.create!(name: "Mike Dao", age: 30)
