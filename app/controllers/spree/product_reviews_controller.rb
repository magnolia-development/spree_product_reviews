module Spree
  class ProductReviewsController < Spree::StoreController
    helper Spree::BaseHelper
    before_action :load_product, only: %i[index new create]
    before_action :authenticate_user!, only: %i[new create]

    def new
      @product_review = Spree::ProductReview.new(product: @product)
      authorize! :create, @product_review
    end

    def create
      @product_review = Spree::ProductReview.new(product_review_params)
      @product_review.product = @product
      @product_review.purchase_date = spree_current_user.recent_purchase_date_for @product
      @product_review.user = spree_current_user
      @product_review.ip_address = request.remote_ip
      @product_review.locale = I18n.locale.to_s
      @product_review.product_name = @product.name

      if @product_review.save
        flash[:success] = Spree.t("spree.product_review.flash_messages.create.success")
        redirect_to spree.product_path(@product)
      else
        flash.now[:error] = Spree.t("spree.product_review.flash_messages.create.error")
        render :new
      end
    end

    def index
      @product_reviews = @product.product_reviews.approved.order(created_at: :desc)
    end

    private

    def load_product
      @product = Spree::Product.friendly.find(params[:product_id])
    end

    def product_review_params
      params.require(:product_review).permit(
        :rating,
        :review,
        :show_identifier,
        :title
      )
    end

    def authenticate_user!
      return if spree_current_user

      session[:spree_user_return_to] = request.fullpath
      redirect_to spree.login_path, alert: Spree.t(:please_log_in)
    end
  end
end

