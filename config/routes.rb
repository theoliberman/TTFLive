Rails.application.routes.draw do
  root 'pages#home'

  post 'update_score' => 'application#update_score', as: 'update_score'
  post 'auto_update' => 'application#auto_update', as: 'auto_update'
  post 'players/refresh/(:input)' => 'players#refresh', as: 'refresh'
  post 'players/add/:player_id' => 'players#add', as: 'add'
  post 'players/delete/:player_id' => 'players#delete', as: 'delete'
  post 'players/reset' => 'players#reset', as: 'reset'
end
