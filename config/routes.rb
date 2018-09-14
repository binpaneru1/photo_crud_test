Rails.application.routes.draw do
  get 'friends/index'
  get 'friends/destroy'
  root 'posts#home' 
  get 'images/:id', to: "images#image"
  get 'friend_request/:id', to: "friend_request#create" , as: 'send_request'
  get 'cancel_friend_request/:id', to: "friend_request#destroy" , as: 'delete_request'
  get 'accept_friend_request/:id', to: "friend_request#response", as: 'response_request'
  get 'decline_friend_request/:id', to: "friend_request#decline", as: 'decline_request'
  delete 'images/:id', to: "images#del",  as: 'images_del'
  get '/profile/:id', to: 'posts#profile'
  resources :posts
  resources :comments
  resources :friends
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
