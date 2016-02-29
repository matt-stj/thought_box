Rails.application.routes.draw do
  get '/', to: 'pages#index'

  get '/login', to: 'users#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'


  resources :users, only: [:new, :create]

end
