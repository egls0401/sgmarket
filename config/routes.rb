Rails.application.routes.draw do
  devise_for :users

  #match ":controller(/:action(/:id))", via: [:get, :post]
  #match ":controller(/:action(/:id))", via: [:get, :post]
  root 'home#index'
  get 'home/index' 
  get 'home/write'
  get 'home/complete'
  post 'home/complete' => 'home#complete'

  post 'home/write'
  get 'home/myinfo'

  get 'delete/:post_id' => 'home#delete'
  post 'update_view/:post_id' => 'home#update_view'
  get 'update_view/:post_id' => 'home#update_view'
  post 'do_update/:post_id' => 'home#do_update'
  get 'do_update/:post_id' => 'home#do_update'
  get 'view_each/:post_id' => 'home#view_each'
  post 'home/reply_write'
  get 'delete_reply/:reply_id' => 'home#delete_reply'

  get 'password_delete/:post_id' => 'home#password_delete'
  get 'password_edit/:post_id' => 'home#password_edit'
  get 'password_finish/:post_id' => 'home#password_finish'
  get '/home/hashtag/:name', to: 'home#hashtags'

  get 'home/tag/:name' => 'home#tags'

  get 'home/show_user_post' => 'home#show_user_post'
  get 'home/show_reply_post' => 'home#show_reply_post'
  get 'home/alarm'
  get 'writer_post/:post_id' => 'home#writer_post'
  get 'home/search'

  get 'finish_post/:post_id' => 'home#finish_post'
  get '/myinfo' => 'home#myinfo'
  
  get '/home/change_pic' => 'home#change_pic'
 
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
