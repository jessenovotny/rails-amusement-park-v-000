Rails.application.routes.draw do


  get 'rides/new'

  get 'welcome/home'

  resources :attractions

  resources :users
  root 'welcome#home'

  get '/signin' => 'sessions#new', as: :login
  post '/signin' => 'sessions#create'

  get '/signout' => 'sessions#destroy', as: :logout

  get '/users/new' => 'users#new', as: :signup

end