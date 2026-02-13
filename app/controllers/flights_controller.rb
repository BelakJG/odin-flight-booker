class FlightsController < ApplicationController
  def index
    @flight_dates = Flight
                    .order(start_datetime: :asc)
                    .pluck(:start_datetime)
  end
end
