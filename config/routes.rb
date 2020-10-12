Rails.application.routes.draw do
  # Organized in order of supposed flow
  resources :users
  root "home#index"

  get '/success', to: 'home#success'
  get '/check', to: 'home#ip_check'
  get '/form', to: 'home#form'
  get '/review', to: 'home#review'
  get '/confirmed', to: 'home#confirmed'
  get '/rated', to: 'home#rated'

  post '/email', to: 'home#mail_success'
  post '/appointment', to: 'users#create'
  post '/rate', to: 'home#rate'
end
