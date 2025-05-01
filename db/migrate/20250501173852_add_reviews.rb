class AddReviews < ActiveRecord::Migration[7.2]
  def change
    create_table :spree_product_reviews do |t|
      t.references :spree_product, null: false, foreign_key: true
      t.references :spree_user, null: false, foreign_key: true
      t.references :spree_variant, foreign_key: true

      t.integer :rating, null: false
      t.string :title, null: false
      t.string :product_name, null: false
      t.datetime :purchase_date
      t.string :ip_address, null: false
      t.string :locale, null: false, default: "en"

      t.boolean :approved, default: false, null: false
      t.boolean :show_identifier, default: false, null: false

      t.timestamps
    end

    add_index :spree_product_reviews, :spree_product_id, name: 'index_reviews_on_product_id'
    add_index :spree_product_reviews, :spree_variant_id, name: 'index_reviews_on_variant_id'
  end
end
