AkatusDemo::Application.routes.draw do

  get  'api'        => 'checkout#api',        :as => :api
  post 'api/pay'    => 'checkout#api_pay',    :as => :api_pay

  get 'formulario' => 'checkout#form',       :as => :form
  get 'javascript' => 'checkout#javascript', :as => :javascript

  post 'api/pay/boleto'      => 'api_checkout#pay_with_boleto',      :as => :api_pay_with_boleto
  post 'api/pay/eft'         => 'api_checkout#pay_with_eft',         :as => :api_pay_with_eft
  post 'api/pay/credit_card' => 'api_checkout#pay_with_credit_card', :as => :api_pay_with_credit_card

  # You can have the root of your site routed with "root"
  root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
