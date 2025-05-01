module SpreeProductReviews
  module Spree
    module Admin
      class ProductReviewsController < ResourceController
        belongs_to "spree/product", find_by: :slug

        include ProductsBreadcrumbConcern

        before_action :add_breadcrumbs

        private
      end
    end
  end
end
