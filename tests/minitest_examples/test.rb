# frozen_string_literal: true

require "minitest/autorun"
require "active_support/test_case"

class DirectoryStyleTest < ActiveSupport::TestCase
  test "runs from test dot rb" do
    assert_equal 2 + 2, 4
  end
end
