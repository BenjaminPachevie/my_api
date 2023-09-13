Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  resources :listings, only: %i[index show create update destroy] do
    resources :bookings, only: %i[index show create update destroy]
    resources :reservations, only: %i[index show create update destroy]
  end
end
