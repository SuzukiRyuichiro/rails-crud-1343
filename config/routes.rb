Rails.application.routes.draw do
  get 'restaurants', to: 'restaurants#index'
  get 'restaurants/:id', to: 'restaurants#show'
end
