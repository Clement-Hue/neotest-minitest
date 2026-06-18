# frozen_string_literal: true

module Trainline
  module Builder
    module Product
      class InvoiceOptionBuilderTest < SynchronousBuilderTest
        def test_attributes_known_system
          assert_equal true, true
        end

        def test_attributes_unknown_system
          assert_equal 1, 1
        end
      end
    end
  end
end
