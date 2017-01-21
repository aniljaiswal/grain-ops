Rails.application.routes.draw do

  root 'tracker#index'

  get  'tracker/generate'

  post 'tracker/updatecurrentloc'

  get  'tracker/order/:id', to: 'tracker#order'
  
end
