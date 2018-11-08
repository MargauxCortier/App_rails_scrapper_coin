Rails.application.routes.draw do
  resources :cryptos
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	root to: 'cryptos#index'
end
