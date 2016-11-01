Rails.application.routes.draw do
  resources :posts
  devise_for :users, skip: [:registrations]
  get root to: 'pages#home'
end


