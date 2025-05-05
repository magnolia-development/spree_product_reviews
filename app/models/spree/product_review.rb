class Spree::ProductReview < Spree::Base
  belongs_to :product, class_name: "Spree::Product"
  belongs_to :user, class_name: "Spree::User"
  belongs_to :variant, class_name: "Spree::Variant", optional: true

  validates :rating, presence: true
  validates :title, presence: true
  validates :review, presence: true

  scope :approved, -> { where(approved: true) }
  scope :pending, -> { where(approved: false) }

  def approve!
    update(approved: true)
  end

  def reject!
    update(approved: false)
  end

  def reviewer_name
    if user&.name && show_identifier
      user.name
    else
      "Anonymous"
    end
  end

  def review_date
    created_at.strftime("%B %d, %Y at %I:%M%p")
  end
end
