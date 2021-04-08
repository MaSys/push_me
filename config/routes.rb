Rails.application.routes.draw do

  namespace(:api, defaults: { format: :json }, path: '/api') do
    api_version(
      module: 'V1',
      path: { value: 'v1' },
      defaults: { format: :json },
      default: true
    ) do
      resources :notifications, only: [] do
        collection do
          post :apnsp8
        end
      end
    end
  end
end
