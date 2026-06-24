local plugin = require("neotest-minitest")
local async = require("nio.tests")

describe("Custom Superclass Test", function()
  assert:set_parameter("TableFormatLevel", -1)

  describe("discover_positions", function()
    async.it("discovers tests that inherit from a custom superclass ending in Test", function()
      local test_path = vim.loop.cwd() .. "/tests/minitest_examples/custom_superclass_test.rb"
      local positions = plugin.discover_positions(test_path):to_list()
      local expected_positions = {
      {
        id = test_path,
        name = "custom_superclass_test.rb",
        path = test_path,
        range = { 0, 0, 13, 0 },
        type = "file",
      },
        {
          {
            id = "./tests/minitest_examples/custom_superclass_test.rb::6",
            name = "Promocode",
            path = test_path,
            range = { 5, 6, 9, 9 },
            type = "namespace",
          },
          {
            {
              id = "./tests/minitest_examples/custom_superclass_test.rb::7",
              name = "test_promocode",
              path = test_path,
              range = { 6, 8, 8, 11 },
              type = "test",
            },
          },
        },
      }

      assert.are.same(expected_positions, positions)
    end)
  end)
end)
