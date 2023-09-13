class ListingsController < ApplicationController
  def index
    @listings = Listing.all

    render json: @listings
  end

  def show
    @listing = Listing.find(params[:id])

    render json: @listing
  end

  def create
    @listing = Listing.new(listing_params)
    @listing.save

    render json: @listing
  end

  def update
    @listing = Listing.find(params[:id])
    @listing.update(listing_params)

    render json: @listing
  end

  def destroy
    @listings = Listing.all
    @listing = Listing.find(params[:id])
    @listing.destroy

    render json: @listings
  end

  private

  def listing_params
    params.required(:listing).permit(:num_rooms)
  end
end
