Rails.application.routes.draw do
  get '/players/football',   to: 'players#football_index'
  get '/players/basketball', to: 'players#basketball_index'
  get '/players/baseball',   to: 'players#baseball_index'
  get '/players/:id',        to: 'players#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
