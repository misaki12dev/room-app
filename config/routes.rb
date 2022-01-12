Rails.application.routes.draw do
  root to: "home#index"
  get "/rooms/posts" => "rooms#posts"
  # post 'reservations/create'
  # post "reservations/" => "reservation#create"
  devise_for :users
  resources :rooms
  resources :reservations
end
