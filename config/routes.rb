Rails.application.routes.draw do
  devise_for :users
  resources :reports

  # Define a custom route for signing out
  delete "users/sign_out" => "devise/sessions#destroy", as: :destroy_user

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "reports#index"
end

