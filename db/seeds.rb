# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

%w[ATL DFW DEN ORD LAX CLT LAS JFK MCO MIA].each do |airport_code|
  Airport.find_or_create_by!(airport_code: airport_code)
end
puts "Airports seeded"

num_flights = 1000
num_flights.times do
  depart, arrive = Airport.all.sample(2)

  Flight.create!(
    departure_airport: depart,
    arrival_airport: arrive,
    start_datetime: (Time.current + rand(1..30).days),
    flight_duration: rand(60..360)
  )
end
puts "#{num_flights} random flights added"
