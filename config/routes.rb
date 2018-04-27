Rails.application.routes.draw do
  get 'ranking/index', to: 'ranking#index', as: 'home'

  get 'ranking/game', to: 'ranking#game', as: 'game'

  get 'ranking/match'

  post 'ranking/match'

  root to: 'ranking#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
