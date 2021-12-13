# frozen_string_literal: true

Rails.application.routes.draw do
  resources :games

  patch '/submit_move/:move', to: 'games#submit_move'
end
