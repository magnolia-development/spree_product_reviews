Spree::Core::Engine.add_routes do
  namespace :admin do
    resources :products do
      resources :product_reviews, only: [:index, :destroy, :edit, :update] do
        member do
          get :approve
        end
      end
    end
  end

  resources :products, only: [] do
    resources :product_reviews, only: [:index, :new, :create]
  end
end
