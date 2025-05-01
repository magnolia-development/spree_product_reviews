module Spree
  module PageSections
    class AddAReview < Spree::PageSection
      TOP_PADDING_DEFAULT = 60
      BOTTOM_PADDING_DEFAULT = 60
      TOP_BORDER_WIDTH_DEFAULT = 0
      BOTTOM_BORDER_WIDTH_DEFAULT = 0

      preference :heading, :string, default: "more than just your average brand"
      preference :heading_size, :string, default: "large"
      preference :heading_alignment, :string, default: "center"
      preference :display, :string, default: "stacked" # "stacked" or "inline"

      def self.role
        "content"
      end

      def display_name
        "Add a Review"
      end

      def blocks_available?
        true
      end

      def default_blocks
        @default_blocks.presence || [
          Spree::PageBlocks::Heading.new(
            text: Spree.t(:add_a_review_heading),
            preferred_text_alignment: "center",
            preferred_bottom_padding: 60
          ),
          Spree::PageBlocks::Text.new(
            text: Spree.t(:add_a_review_text),
            preferred_text_alignment: "center",
            preferred_bottom_padding: 60,
            preferred_width_desktop: "60",
            preferred_container_alignment: "center"
          ),
        ]
      end

      def available_blocks_to_add
        [
          Spree::PageBlocks::Heading,
          Spree::PageBlocks::Text,
        ]
      end

      def icon_name
        "writing"
      end

      def links_available?
        false
      end
    end
  end
end
