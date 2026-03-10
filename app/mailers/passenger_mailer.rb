class PassengerMailer < ApplicationMailer
  default from: "bookings@example.com"

  def confirm_email
    @booking = params[:booking]
    @flight = @booking.flight
    @passengers = @booking.passengers
    @url = "http://example.com/login"
    @passengers.each do |passenger|
      mail(to: passenger.email, subject: "Your flight is booked")
    end
  end
end
