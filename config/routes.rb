Rails.application.routes.draw do
  

  get 'posts/index'
  # ----------- h o m e -------------
  get '/' => "home#top"
  

  # ----------- u s e r s ------------
  get "users/timeline" => "users#timeline"
  get "users/:id" => "users#show"
  post "login" => "users#login"
  post "users/create" => "users#create"
  get "logout" => "users#logout"
  post "users/edit" => "users/edit"

  # ------------- p o s t s ----------
  get "posts/:id" => "posts#show"
  post "posts/create" => "posts#create"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
