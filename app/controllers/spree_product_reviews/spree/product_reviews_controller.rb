module SpreeProductReviews
  module Spree
    class ProductReviewsController < Spree::StoreController
      belongs_to "spree/product", find_by: :slug

      include ProductsBreadcrumbConcern

      before_action :add_breadcrumbs

      private

    end
  end
end
