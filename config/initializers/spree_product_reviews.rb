Rails.application.config.after_initialize do
  Rails.application.config.spree_admin.product_dropdown_partials << "spree_product_reviews/admin/product_reviews_dropdown"
end

