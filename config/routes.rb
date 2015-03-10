Rails.application.routes.draw do
  get 'images' => 'images#index'
  
  resources :albums do
    resources :images
  end
  # get 'append_image' => 'albums#append_image'
  get 'pages/about', to: 'pages#show_or_set'
  resources :pages, except: :index
  root 'albums#index' # 'pages#welcome'
end
