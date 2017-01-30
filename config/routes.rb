Rails.application.routes.draw do
  root 'to_dos#index'

  resources :to_dos
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
