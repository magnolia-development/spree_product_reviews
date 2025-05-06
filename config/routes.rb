Spree::Core::Engine.add_routes do
  namespace :admin do
    resources :products do
      resources :product_reviews, only: %i[index destroy edit update] do
        member do
          get :approve
        end
      end
    end
  end

  resources :products, only: [] do
    resources :product_reviews, only: %i[index new create] do
    end
  end
end

