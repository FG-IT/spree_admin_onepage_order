Spree::Core::Engine.add_routes do
  # Add your extension routes here
  Spree::Core::Engine.add_routes do
    namespace :admin, path: Spree.admin_path do
      resources :orders
    end
  end
end
