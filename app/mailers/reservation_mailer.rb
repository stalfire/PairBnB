class ReservationMailer < ApplicationMailer
	def booking_email(customer, host, reservation_id)
		@customer = customer
		@host = host
		@booking = Booking.find(reservation_id)
		mail(to: @customer.email, subject: 'Reservation confirm')
	end
end
