Rails.application.routes.draw do
  root 'orders#new'
  resources :orders, only: [:index, :new, :create] do
    member do
      get 'close', to: 'orders#close', as: :close
    end
  end
end
