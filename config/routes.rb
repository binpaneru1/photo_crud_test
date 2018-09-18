Rails.application.routes.draw do
  get 'decline_friend_request/:id', to: "friend_responses#decline_request", as: 'decline_request'
  
  get 'friends/index'
  get 'friends/destroy'
  root 'posts#home' 
  get 'images/:id', to: "images#image"
  post 'friend_request/:id', to: "friend_request#create" , as: 'send_request'
  get 'cancel_friend_request/:id', to: "friend_request#destroy" , as: 'delete_request'
  get 'accept_friend_request/:id', to: "friend_responses#friend_res", as: 'response_request'
  delete 'images/:id', to: "images#del",  as: 'images_del'
  get '/profile/:id', to: 'posts#profile'
   #routes for Profile
  get 'friend_list/:id', to: "profile#friends", as: 'friend_list'
  get 'photos/:id', to: "profile#images", as: 'photo_gallery'

  resources :posts
  resources :comments
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
