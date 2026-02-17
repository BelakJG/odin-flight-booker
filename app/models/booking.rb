class Booking < ApplicationRecord
  has_many :passenger_bookings
  has_many :passengers, through: :passenger_bookings, inverse_of: :bookings
end
