Rails.application.routes.draw do
  #post 'user_token' => 'user_token#create'
  get "users/index"
  get "users/findByUsername"
  get "users/show"
  post "users/create"
  put "users/updated"
  resources :users
end
