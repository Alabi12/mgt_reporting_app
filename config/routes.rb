Rails.application.routes.draw do
  root "reports#index"
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  # delete "users/sign_out" => "devise/sessions#destroy", as: :destroy_user_session
  resources :reports
end
