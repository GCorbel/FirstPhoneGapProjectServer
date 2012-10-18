MyFirstProjectServer::Application.routes.draw do
  get "main/index"
  root to: "main#index"

  resources :inquiries, only: [:show, :new, :create, :index]
  match '/inquiries', controller: :inquiries, action: :options, constraints: {method: 'OPTIONS'}
  match '/inquiry', controller: :inquiries, action: :options, constraints: {method: 'OPTIONS'}
  match '/inquiry/:id', controller: :inquiries, action: :options, constraints: {method: 'OPTIONS'}
  match '/inquiries/:id', controller: :inquiries, action: :options, constraints: {method: 'OPTIONS'}
end
