class PassengerMailer < ApplicationMailer
  default from: "bookings@example.com"

  def confirm_email
    @booking = params[:booking]
    @passenger = params[:passenger]
    @flight = @booking.flight
    @url = "http://example.com/login"

    mail(to: @passenger.email, subject: "Your flight is booked")
  end
end
