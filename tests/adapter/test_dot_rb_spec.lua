local plugin = require("neotest-minitest")
local async = require("nio.tests")

describe("test.rb discovery", function()
  assert:set_parameter("TableFormatLevel", -1)

  async.it("discovers Rails-style tests in a plain test.rb file", function()
    local test_path = vim.loop.cwd() .. "/tests/minitest_examples/test.rb"
    local positions = plugin.discover_positions(test_path):to_list()
    local expected_positions = {
      {
        id = test_path,
        name = "test.rb",
        path = test_path,
        range = { 0, 0, 10, 0 },
        type = "file",
      },
      {
        {
          id = "./tests/minitest_examples/test.rb::6",
          name = "DirectoryStyleTest",
          path = test_path,
          range = { 5, 0, 9, 3 },
          type = "namespace",
        },
        {
          {
            id = "./tests/minitest_examples/test.rb::7",
            name = "runs from test dot rb",
            path = test_path,
            range = { 6, 2, 8, 5 },
            type = "test",
          },
        },
      },
    }

    assert.are.same(expected_positions, positions)
  end)
end)
