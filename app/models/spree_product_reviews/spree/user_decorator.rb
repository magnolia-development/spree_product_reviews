module SpreeProductReviews
  module Spree
    module UserDecorator
      def self.prepended(base)
        base.has_many :product_reviews, class_name: 'Spree::ProductReview', dependent: :destroy
      end

      def product_review_for(product)
        product_reviews.find_by(product_id: product.id, user_id: id)
      end

      ::Spree::Product.prepend self
    end
  end
end

Spree::User.prepend SpreeProductReviews::Spree::UserDecorator

