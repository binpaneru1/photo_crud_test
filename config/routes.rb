Rails.application.routes.draw do
  root 'posts#home' 
  get 'images/:id', to: "images#image"
  delete 'images/:id', to: "images#del",  as: 'images_del'
  get '/profile', to: 'posts#profile'
  resources :posts
  resources :comments
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html



end
