Rails.application.routes.draw do
  resources :posts
  devise_for :users
  get root to: 'pages#home'
end
