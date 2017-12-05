class BookingsController < ApplicationController
  def new
    @listing = Listing.find(params[:listing_id])
    @booking = Booking.new
  end
  def create
    @listing = Listing.find(params[:listing_id])
    @host = User.find(@listing.user_id)
    @booking = current_user.bookings.new(booking_params)
    @booking.listing = @listing
    if @booking.save
      ReservationMailer.booking_email(current_user,@host,@booking.id).deliver_later
      redirect_to booking_path(current_user.id)
    else
      redirect_to root_path
    end
  end
  def show
    @booking = Booking.where(user_id:current_user.id)
    @listing = Listing.all
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to booking_path(current_user.id)
  end

  def booking_params
    params.require(:booking).permit(:num_guests, :start_date, :end_date, :user_id,:listing_id)
  end
end
