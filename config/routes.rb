Rails.application.routes.draw do
  resources :clinks
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "clinks#index"
end
