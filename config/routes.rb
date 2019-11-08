Rails.application.routes.draw do
  get 'parking/:plate', to: 'parkings#index'
  put 'parking/:id/out', to: 'parkings#out'
  put 'parking/:id/pay', to: 'parkings#pay'
  post 'parking', to: 'parkings#create'
end
