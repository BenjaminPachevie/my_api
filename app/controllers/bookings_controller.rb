class BookingsController < ApplicationController
  def index
    @bookings = Booking.where(params[:id])

    render json: @bookings
  end

  def show
    @booking = Booking.find(params[:id])

    render json: @booking
  end

  def create
    @listing = Listing.find(params[:listing_id])
    @booking = Booking.new(booking_params)
    @booking.listing = @listing
    @booking.save

    render json: @booking
  end

  def destroy
    @listings = Listing.where(params[:listing_id])
    @bookings = Booking.where(listing: @listings)
    @booking = Booking.find(params[:id])
    @booking.destroy

    render json: @bookings
  end

  private

  def booking_params
    params.required(:booking).permit(:start_date, :end_date)
  end
end
