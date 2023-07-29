Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do 
      resources :contacts
      resources :sessions, only: %i[create destroy]
    end
  end
end
