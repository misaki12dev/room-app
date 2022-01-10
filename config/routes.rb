Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  get "/rooms/posts" => "rooms#posts"
  resources :rooms
end
