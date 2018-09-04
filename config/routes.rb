Rails.application.routes.draw do
  root 'posts#home'
   get '/profile', to: 'posts#profile'
  resources :posts
  resources :comments
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html



end
