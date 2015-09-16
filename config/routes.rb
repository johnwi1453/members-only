Rails.application.routes.draw do
  root                         'sessions#new'

  resources    :sessions, only:   [ :new, :create, :destroy ]
  get         'login'             => 'sessions#new'
  post        'login'             => 'sessions#create'
  delete      'logout'            => 'sessions#destroy'

  resources    :users
  resources    :posts, only:      [:new, :create, :index]
end