Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  scope '/api' do
    get 'employees', to: 'employees#index'
    get 'arbitrary', to: 'arbitrary#index'
  end


  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # this catch-all route allows us to defer all frontend route handling to react
  get '*path', to: 'static#frontend'

  # Defines the root path route ("/")
  root "static#frontend"
end
