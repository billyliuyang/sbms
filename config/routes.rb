Rails.application.routes.draw do
  resources :emotions
  get 'admin/index'

  controller :session do
  	get 'login' => :new
  	post 'login' => :create
  	delete 'logout' => :destroy
  end

  controller :emotions do
    get 'collection' => :collect
    post 'collection' => :change
  end

  resources :users
  root 'temp#index', as: 'temp_index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
