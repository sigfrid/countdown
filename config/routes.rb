Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'

  root to: 'counts#new'

  get '/counts', to: 'counts#new'
  post '/counts/start', to: 'counts#start'
  post '/counts/stop', to: 'counts#stop'
  post '/counts/resume', to: 'counts#resume'
  post '/counts/collected', to: 'counts#collected'
end
