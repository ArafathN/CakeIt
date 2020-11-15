Rails.application.routes.draw do
  
  resources :cakes
  devise_for :users
 root 'pages#home'

 get 'dashboard' => 'pages#dashboard'

 post '/buy/:slug', to:'transactions#create', as: :buy
 get '/pickup/:uuid', to: 'transactions#pickup', as: :pickup
end
