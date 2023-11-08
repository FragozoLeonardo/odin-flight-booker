# frozen_string_literal: true

class BookingsController < ApplicationController
  before_action :load_flight, only: [:new]
  before_action :load_booking, only: [:show]

  def new
    if params[:flight_id].present?
      @flight = Flight.find(params[:flight_id])
      @passengers = Passenger.all
      @booking = Booking.new(flight_id: params[:flight_id])
    else
      redirect_to flights_path, alert: 'Please select a flight.'
    end
  end

  def create
    @flight = Flight.find(params[:booking][:flight_id])
    @passengers = Passenger.all
    @booking = Booking.new(booking_params)
    @passenger = Passenger.find_by(id: params[:booking][:passenger_id])

    if params[:booking][:flight_id].present? && params[:booking][:passenger_id].present?
      if @booking.save && @passenger
        @booking.passengers << @passenger
        Rails.logger.debug "Booking saved with id: #{@booking.id}"
        redirect_to booking_path(@booking), notice: 'Booking was successfully created.'
      else
        Rails.logger.debug "Error saving booking: #{@booking.errors.full_messages.join(', ')}"
        flash.now[:alert] = 'There was an error while saving the booking.'
        render :new
      end
    else
      flash.now[:alert] = 'Please select a flight and a passenger.'
      render :new
    end
  end

  def show
    @booking = Booking.includes(:flight, :passengers).find_by(id: params[:id])

    return unless @booking.nil?

    redirect_to root_path, alert: 'Booking not found.'
  end

  private

  def booking_params
    params.require(:booking).permit(:flight_id, :passenger_id)
  end

  def passenger_params
    params.require(:passenger).permit(:name, :email)
  end

  def load_flight
    if params[:flight_id].present? && (flight = Flight.find_by(id: params[:flight_id]))
      @flight = flight
    else
      redirect_to flights_path, alert: 'Please select a flight.'
    end
  end

  def load_booking
    @booking = Booking.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path, alert: 'Booking not found.'
  end
end
