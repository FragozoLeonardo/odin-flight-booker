# frozen_string_literal: true

class FlightsController < ApplicationController
  def index
    if params[:departure_airport_id].present? || params[:arrival_airport_id].present? || params[:start_datetime].present? || params[:passenger_count].present?
      @flights = Flight.all

      if params[:departure_airport_id].present?
        @flights = @flights.where(departure_airport_id: params[:departure_airport_id])
      end

      @flights = @flights.where(arrival_airport_id: params[:arrival_airport_id]) if params[:arrival_airport_id].present?

      @flights = @flights.where('start_datetime >= ?', params[:start_datetime]) if params[:start_datetime].present?

      @flights = @flights.where('passenger_count >= ?', params[:passenger_count]) if params[:passenger_count].present?
    else
      @flights = []
    end
  end
end
