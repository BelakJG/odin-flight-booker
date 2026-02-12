class Airport < ApplicationRecord
  validates :airport_code, presence: true

  has_many :departing_flights, class_name: "Flight", inverse_of: :departure_airport
  has_many :arriving_flights, class_name: "Flight", inverse_of: :arrival_airport
end
