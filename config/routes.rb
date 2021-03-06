Rails.application.routes.draw do
  resources :records
  
  get 'main/index'
  root 'main#index'

  get 'image' => 'record#image'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
