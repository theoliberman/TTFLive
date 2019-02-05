Rails.application.routes.draw do
  root 'pages#home'

  post 'update_score' => 'application#update_score', as: 'update_score'
  post 'players/refresh/(:input)' => 'players#refresh', as: 'refresh'

end
