Rails.application.routes.draw do
  devise_for :users
  get root to: 'pages#home'
end
