Rails.application.routes.draw do
  get '/signup' => 'users#new'

  root 'static_pages#home'  # get '/' => 'static_pages#home'
  get '/about' => 'static_pages#about'
  get '/contact' => 'static_pages#contact'

end
