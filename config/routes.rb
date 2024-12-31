Rails.application.routes.draw do
  # resources :posts, param: :id, constraints: { id: ->(req) { valid_encrypted_id?(req.params[:id]) } }

  #resources :posts, param: :id, constraints: { id: /[a-zA-Z0-9\.\$]{20,}/ }
  
  resources :posts, param: :id, constraints: { id: /.*/ }
  
  #resources :posts#, param: :encrypted_id_string || params: :id
  #resources :posts, param: :encrypted_id_string
  root "posts#index"
  
end
