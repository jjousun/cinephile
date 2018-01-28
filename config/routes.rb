Rails.application.routes.draw do
  get 'movies/index'

  get "/movies/new", to: "movies#new", as: "new_movie"
  post "/movies", to: "movies#create", as: "movies"

  get '/movies/:id/edit', to: 'movies#edit', as: "edit_movie"

  get "/movies/:id", to: "movies#show", as: "movie"

  patch '/movies/:id', to: 'movies#update'

  get "/movies", to: "movies#index"

  delete "/movies/:id", to: "movies#destroy"
end
