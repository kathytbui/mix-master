Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/artists', to: 'artists#index'
  get '/artists/new', to: 'artists#new'
  post '/artists', to: 'artists#create'
  get '/artists/:id', to: 'artists#show'
  get 'artists/:id/edit', to: 'artists#edit'
  patch '/artists/:id', to: 'artists#update'
  delete '/artists/:id/edit', to: 'artists#destroy'

  get 'songs', to: 'songs#index'
  get '/artists/:id/songs/new', to: 'songs#new'
  post '/artists/:id/songs', to: 'songs#create'
  get '/songs/:id', to: 'songs#show'


end
