Rails.application.routes.draw do
  root "application#index" 
 
  namespace :api, defaults:{format: :json} do
    resources :movies, only: [:index, :show, :create, :new], param: :title
    
    resources :genres
  end
  
end
