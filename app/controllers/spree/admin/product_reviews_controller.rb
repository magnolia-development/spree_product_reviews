module Spree
  module Admin
    class ProductReviewsController < ResourceController
      belongs_to "spree/product", find_by: :slug

      # Not in 5.0.2 but coming soon so note to future me ;)
      # include ProductsBreadcrumbConcern
      #
      # before_action :add_breadcrumbs

      def index; end
    end
  end
end

