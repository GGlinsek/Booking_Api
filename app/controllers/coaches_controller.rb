class CoachesController < ApplicationController
  before_action :set_coach, only: %i[ show update destroy bookings]

  def index
    @coaches = Coach.all

    render json: @coaches
  end

  def show
    render json: @coach
  end

  def bookings
    @bookings = @coach.bookings
    render json: @bookings
  end

  def update
    if @coach.update(coach_params)
      render json: @coach
    else
      render json: @coach.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @coach.destroy
  end

  private

  def set_coach
    @coach = Coach.find(params[:id])
  end

  def coach_params
    params.require(:coach).permit(:name)
  end
end
