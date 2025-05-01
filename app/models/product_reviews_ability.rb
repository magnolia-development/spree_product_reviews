module Spree
  class ProductReviewsAbility
    include CanCan::Ability

    def initialize(user)
      if user.has_spree_role? "admin"
        can :manage, Spree::ProductReview
      elsif user.has_spree_role? "user"
        can :create, Spree::ProductReview
        can :update, Spree::ProductReview do |review|
          review.user_id == user.id
        end
        can :destroy, Spree::ProductReview do |review|
          review.user_id == user.id
        end
      else
        can :read, Spree::ProductReview, public: true
        cannot :create, Spree::ProductReview
        cannot [:update, :destroy], Spree::ProductReview
      end
    end
  end
end
