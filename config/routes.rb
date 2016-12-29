Rails.application.routes.draw do
  get 'static_pages/welcome'

  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      resources :timestamps, only: [:show]
    end
  end
  root 'static_pages#welcome'
end
