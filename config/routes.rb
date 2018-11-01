Rails.application.routes.draw do
  resources :comments
  resources :gossips
	root to: 'users#new'
 resources :users, only: [:new, :create]
end
