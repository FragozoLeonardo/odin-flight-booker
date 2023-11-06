# frozen_string_literal: true

Rails.application.routes.draw do
  get 'flights/index'
  root 'flights#index'
  resources :flights, only: [:index]
end
