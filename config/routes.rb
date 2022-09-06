Rails.application.routes.draw do
  # root 'pages#home'
  resources :expenses 
  get 'statcategory', to: "expenses#count_cat"
  get 'login', to: "sessions#new"
  root 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'signup', to: 'users#new'
  resources :users, except: [:new]
end
