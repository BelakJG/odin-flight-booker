class BookingsController < ApplicationController
  def new
    @booking = Booking.new(flight_id: params[:flight_id])

    @num_passengers = params[:num_passengers].to_i
    @num_passengers.times do
      @booking.passengers.build
    end
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to @booking
    else
      render :new
    end
  end

  def show
    @booking = Booking.find(params[:id])
    @flight = @booking.flight
    @passengers = @booking.passengers
  end

  private
  def booking_params
    params.require(:booking).permit(
      :flight_id,
      passengers_attributes: [ :email, :name ]
    )
  end
end
