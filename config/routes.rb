Rails.application.routes.draw do
  root 'offers#index'

  resources :offers, only: [] do
      get "fetch_offers", on: :collection
  end
end
