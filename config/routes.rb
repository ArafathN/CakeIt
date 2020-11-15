Rails.application.routes.draw do
  
  resources :cakes
  devise_for :users
 root 'pages#home'

 get 'dashboard' => 'pages#dashboard'
end
