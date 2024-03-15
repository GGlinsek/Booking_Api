class BookingsController < ApplicationController
  before_action :set_booking, only: %i[ show update destroy ]

  def index
    @bookings = Booking.all

    render json: @bookings
  end

  def show
    render json: @booking
  end

  def update
    if @booking.update(booking_params)
      render json: @booking
    else
      render json: @booking.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @booking.destroy
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:name, :coach_id, :start_at, :end_at)
  end
end
