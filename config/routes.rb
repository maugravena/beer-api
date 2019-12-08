Rails.application.routes.draw do
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :beers
      get '/beer-suggestion', to: 'beers#suggestion'
    end
  end
end
