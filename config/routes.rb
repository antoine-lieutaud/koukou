Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :travels do
    resources :bookings, only: [:new, :create, :edit, :update]
  end

  resources :bookings, only: [:destroy]

  get "bookings/:id/confirmation", to: "bookings#confirmation", as: :confirmation
  
  get "dashboard", to: "dashboards#show", as: :dashboard
end
