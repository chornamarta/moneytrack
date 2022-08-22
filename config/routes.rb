Rails.application.routes.draw do
  root 'pages#home'
  get 'login', to: "session#new"
end
