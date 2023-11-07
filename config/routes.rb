# frozen_string_literal: true

Rails.application.routes.draw do
  get 'bookings/new'
  get 'flights/index'
  root 'flights#index'
  resources :passengers
  resources :flights
  resources :bookings
end
