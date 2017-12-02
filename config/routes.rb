Rails.application.routes.draw do

  root 'static_pages#home'  # get '/' => 'static_pages#home'
  get '/about' => 'static_pages#about'
  get '/contact' => 'static_pages#contact'

  get '/signup' => 'users#new'
  resources :users do
    collection do
      get 'search'
    end
  end

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  resources :notes, only:[:create, :destroy]
  
end
