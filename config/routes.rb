Rails.application.routes.draw do
  devise_for :users
  get ":user_id/edit", to: "profiles#edit", as: :edit_profile
  patch ":user_id/edit", to: "profiles#update", as: :update_profile

  resources :bookings
  get "bookings/:id/edit_cancel" => "bookings#edit_cancel", as: :edit_cancel
  post "/bookings/cancel" => "bookings#cancel"

  namespace :admin do
    resources :users, only: [:edit, :update, :index]
    resources :bookings
    post "/bookings/:id" => "bookings#cancel_booking"
    post "/deactivate", to: "users#deactivate"
    post "/activate", to: "users#activate"
  end
  root "bookings#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
