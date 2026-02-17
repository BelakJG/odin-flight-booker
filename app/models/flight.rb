class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: "Airport", foreign_key: "departure_airport_id"
  belongs_to :arrival_airport, class_name: "Airport", foreign_key: "arrival_airport_id"
  has_many :bookings
  has_many :passengers, through: :bookings

  def self.search(params)
    @flights = Flight.where(departure_airport_id: params[:departure_airport_id],
                            arrival_airport_id: params[:arrival_airport_id])
    @flights = @flights.where("DATE(start_datetime) = ?", params[:flight_date])
    @flights
  end
end
