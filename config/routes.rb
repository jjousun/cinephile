Rails.application.routes.draw do
  resources :movies, only: [:index, :show, :create, :new], param: :title
  
  resources :genres
end
