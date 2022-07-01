Rails.application.routes.draw do  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users do
    resources :tests do
      get 'results', on: :member
    end      
  end

  root to: "users#show"  
  # post "users/start_test"
  # get "tests/results", to: "tests#results"
  # get "tests", to: "tests#index"  
end
