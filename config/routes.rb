Rails.application.routes.draw do
  root 'static_pages#home'
  resources :users, only: [:new, :create, :index]
  resources :gossips do
    resources :comments, except: [:index, :show]
  end
  get '/gossips/:gossip_id/like/create', to: 'like#create'
  get '/gossips/:gossip_id/like/destroy', to: 'like#destroy'
  get '/comments/:comment_id/comment/new', to: 'comments#new', as: 'new_comment_comment'
  post '/comments/:comment_id/comments', to: 'comments#create', as: 'comment_comments' 
  get 'registration/new'
  get '/logout', to: 'registration#logout'
  get '/not_connected', to: 'static_pages#not_connected'
  get '/invalid_login_password', to: 'static_pages#invalid_login_password'
  post 'registration/create'

end
