Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      get '/movies/:title', to: 'movies#show'
      resources :movies, only: [:index, :create]
      patch '/movies/:title', to: 'movies#update'
    end
  end
end
