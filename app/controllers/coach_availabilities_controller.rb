class CoachAvailabilitiesController < ApplicationController
  before_action :set_coach, only: %i[ show update destroy ]

  def index
    @coach_availabilities = CoachAvailability.all

    render json: @coach_availabilities
  end

  def show
    render json: @coach_availability
  end

  def update
    if @coach_availability.update(coach_availability_params)
      render json: @coach_availability
    else
      render json: @coach_availability.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @coach_availability.destroy
  end

  private

  def set_coach
    @coach_availability = CoachAvailability.find(params[:id])
  end

  def coach_availability_params
    params.require(:coach_availability).permit(:coach_id, :timezone, :day_of_week, :start_at, :end_at)
  end
end
