Rails.application.routes.draw do
  get '/', to: 'pages#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'


  resources :users, only: [:new, :create]
  resources :links, except: [:show, :delete]

  namespace :api do
    namespace :v1 do
      resources :links, only: [:index, :show]
    end
  end



end
