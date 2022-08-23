Rails.application.routes.draw do
  root 'pages#home'
  resources :expenses
  get 'login', to: "sessions#new"
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'signup', to: 'users#new'
  resources :users, except: [:new]
end
