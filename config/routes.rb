Rails.application.routes.draw do
  # resources :images
  get 'images' => 'images#index'
  
  resources :albums do
    # get 'append_image', on: :member
    resources :images
  end
  get 'append_image' => 'albums#append_image'
  get 'pages/about', to: 'pages#show_or_set'
  resources :pages, except: :index
  # root 'pages#welcome'
  root 'albums#index'
end
