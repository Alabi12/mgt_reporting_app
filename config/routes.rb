Rails.application.routes.draw do
  root "reports#index"
  
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  
  get 'reports/summary', to: 'reports#summary', as: 'reports_summary'

  resources :reports do
    collection do
      get :attendance_input
      post :attendance, action: :submit_attendance
    end
  end
end
