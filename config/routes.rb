Rails.application.routes.draw do
  root 'pages#home'
  resources :expenses
  get 'login', to: "session#new"
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
