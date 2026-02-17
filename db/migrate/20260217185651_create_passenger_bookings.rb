class CreatePassengerBookings < ActiveRecord::Migration[8.1]
  def change
    create_table :passenger_bookings do |t|
      t.belongs_to :booking
      t.belongs_to :passenger

      t.timestamps
    end
  end
end
