Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
get '/movies' => 'movie#index'
post '/login', to: 'auth#create'
post '/users', to: 'user#create'

resources :users
resources :favorites, only: [:create, :destroy]
resources :sessions, only: [:create, :destroy]
end
