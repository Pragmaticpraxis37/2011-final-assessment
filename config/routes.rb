Rails.application.routes.draw do
  resources :doctors, only: [:index, :show]
  resources :surgeries, only: [:show]
end
