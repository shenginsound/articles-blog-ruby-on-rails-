Rails.application.routes.draw do
  resources :articles
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  root 'pages#home'
  get 'about', to:'pages#about'
  # when the route is signup, I go to the user ciontroller, and the action is new
  get 'signup', to:'users#new'
  resources :users, except: [:new]

  # login and log out don't need to hit database, we don't need to 
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  
  delete 'logout', to: 'sessions#destroy'

end
