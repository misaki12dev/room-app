Rails.application.routes.draw do
  root to: "home#index"
  get "/rooms/posts" => "rooms#posts"
  get 'search' => 'rooms#search'
  devise_for :users
  resources :rooms
  resources :reservations
end
