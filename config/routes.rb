Rails.application.routes.draw do
  root to: "home#index"
  get "/rooms/posts" => "rooms#posts"
  get 'search' => 'rooms#search'
  devise_for :users
  devise_scope :user do
    get '/users/profile', to: 'users/registrations#profile', as: "profile"
    patch '/users/profile_update', to: 'users/registrations#profile_update', as: "profile_update"
    get '/users/account', to: 'users/registrations#account', as: "account"
  end
  resources :rooms
  resources :reservations
end
