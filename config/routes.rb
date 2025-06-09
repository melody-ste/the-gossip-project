Rails.application.routes.draw do

  root "static_pages#home"
  get '/team', to: 'static_pages#team'
  get '/contact', to: 'static_pages#contact'

 get '/welcome/:first_name', to: 'static_pages#welcome'
get '/users/:id', to : 'users#show'
end
