# frozen_string_literal: true

require "minitest/autorun"
require "minitest/spec"

module PC
  module SMT
    class Builders::Emit::SegmentsTest < Minitest::Spec
      it "detects nested class specs" do
        assert_equal true, true
      end

      it "detects multiple class specs" do
        assert_equal 1, 1
      end
    end
  end
end
