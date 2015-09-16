Rails.application.routes.draw do
  root                            'posts#index'
  resources    :posts, only:      [:new, :create, :index]

  resources    :sessions, only:   [ :new, :create, :destroy ]
  get         'login'             => 'sessions#new'
  post        'login'             => 'sessions#create'
  delete      'logout'            => 'sessions#destroy'

  resources    :users
end