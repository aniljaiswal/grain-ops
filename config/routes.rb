Rails.application.routes.draw do

  root 'tracker#index'

  get  'tracker/generate'

  post 'tracker/updatecurrentloc'

  post 'tracker/updatestatus'

  post  'tracker/pathdata'

  get  'tracker/order/:id', to: 'tracker#order'
  
end
