JiraWebhookInspector::Application.routes.draw do
  resources :requests do
    collection do
      post 'webhook'
    end
  end

  root 'requests#index'


end
