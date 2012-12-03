RubygemsStatus::Application.routes.draw do
  root :to => 'status#show'

  match 'status' => 'status#show', as: :status, format: :json
end
