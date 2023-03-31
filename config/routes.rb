Rails.application.routes.draw do
  resources :hero_powers, only: [:create]
  resources :powers, only: %i[index show update]
  resources :heros, only: %i[index show]
end