class FlightsController < ApplicationController
  def index
    @flight_dates = Flight
                    .distinct
                    .order(start_datetime: :asc)
                    .pluck(:start_datetime)
                    .map(&:to_date)
                    .uniq

    @flights = Flight.search(params)
  end
end
