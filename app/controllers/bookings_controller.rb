# frozen_string_literal: true

class BookingsController < ApplicationController
  before_action :load_flight, only: [:new]
  before_action :load_booking, only: [:show]

  def new
    if params[:flight_id].present? && (flight = Flight.find_by(id: params[:flight_id]))
      @flight = flight
      @passenger_count = params[:passenger_count].to_i
      @booking = Booking.new(flight: @flight)
      @passenger_count.times { @booking.passengers.build(flight_id: @flight.id) }
    else
      redirect_to flights_path, alert: 'Please select a flight.'
    end
  end

  def create
    @booking = Booking.new(booking_params)

    if @booking.save
      redirect_to booking_path(@booking), notice: 'Booking was successfully created.'
    else
      flash.now[:alert] = 'There was an error while saving the booking.'
      render :new
    end
  end


  def show

  end

  private

  def booking_params
    params.require(:booking).permit(:flight_id, :passenger_id, passengers_attributes: %i[id name email])
  end


  def load_flight
    if params[:flight_id].present? && (flight = Flight.find_by(id: params[:flight_id]))
      @flight = flight
    else
      redirect_to new_booking_path, alert: 'Please select a flight.'
    end
  end

  def load_booking
    @booking = Booking.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path, alert: 'Booking not found.'
  end
end
