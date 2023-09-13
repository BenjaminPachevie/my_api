class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.where(params[:id])

    render json: @reservations
  end

  def show
    @reservation = Reservation.find(params[:id])

    render json: @reservation
  end

  def create
    @listing = Listing.where(params[:listing_id])
    @reservation = Reservation.new(reservation_params)
    @reservation.listing = @listing
    @reservation.save

    render json: @reservation
  end

  def destroy
    @listings = Listing.where(params[:listing_id])
    @reservations = Reservation.where(listings: @listings)
    @reservation = Reservation.find(params[:id])
    @reservation.destroy

    render json: @reservations
  end

  private

  def reservation_params
    params.required(:reservation).permit(:start_date, :end_date)
  end
end
