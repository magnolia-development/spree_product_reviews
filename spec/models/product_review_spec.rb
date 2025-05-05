RSpec.describe Spree::ProductReview, type: :model do
  context "validations" do
    it "is valid with valid attributes" do
      expect(build(:product_review)).to be_valid
    end

    it "is not valid without a product" do
      expect(build(:product_review, product: nil)).not_to be_valid
    end

    it "is not valid without a user" do
      expect(build(:product_review, user: nil)).not_to be_valid
    end

    context "rating" do
      it "is not valid without a rating" do
        expect(build(:product_review, rating: nil)).not_to be_valid
      end

      it "is not valid with a rating less than 1" do
        expect(build(:product_review, rating: 0)).not_to be_valid
      end

      it "is not valid with a rating greater than 5" do
        expect(build(:product_review, rating: 6)).not_to be_valid
      end

      it "does not validate when the rating is not a number" do
        expect(build(:product_review, rating: "five")).not_to be_valid
      end

      it "does not validate when the rating is a float" do
        expect(build(:product_review, rating: 4.5)).not_to be_valid
      end

      (1..5).each do |valid_rating|
        it "is valid with a rating of #{valid_rating}" do
          expect(build(:product_review, rating: valid_rating)).to be_valid
        end
      end
    end

    it "is not valid without a title" do
      expect(build(:product_review, title: nil)).not_to be_valid
    end

    it "is not valid without a review" do
      expect(build(:product_review, review: nil)).not_to be_valid
    end
  end
end
