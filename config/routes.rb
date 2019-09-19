Rails.application.routes.draw do
  devise_for :users
  get ":user_id/edit", to: "profiles#edit", as: :edit_profile
  patch ":user_id/edit", to: "profiles#update", as: :update_profile
  resources :bookings

  namespace :admin do
    resources :bookings
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
