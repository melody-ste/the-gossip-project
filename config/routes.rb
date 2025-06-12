Rails.application.routes.draw do
  root "static_pages#home"
  
  resources :static_pages, only: [] do
    collection do
      get :team
      get :contact
    end
  end

  resources :welcome, only: [:show]
  resources :users, only: [:new, :create, :show]
  resources :cities, only: [:show]
  resources :gossips do
    resources :comments, only:[:create] #le com appartient a un gossip spécifique
    resources :likes, only: [:create, :destroy]
  end
  resources :comments, only: [:edit, :update, :destroy] do
    resources :likes, only: [:create, :destroy]
  end
  resource :session, only: [:new, :create, :destroy]

  get 'signup', to: 'users#new'
 

end
