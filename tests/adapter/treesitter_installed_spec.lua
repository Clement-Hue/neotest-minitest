local function is_treesitter_installed()
  local ok, _ = pcall(require, "nvim-treesitter")
  return ok
end

local function is_ruby_parser_installed()
  local function contains(list, value)
    for _, item in ipairs(list) do
      if item == value then return true end
    end
    return false
  end

  local _, treesitter = pcall(require, "nvim-treesitter")
  return contains(treesitter.get_installed("parsers"), "ruby")
end

describe("Treesitter check", function()
  it("should check if Treesitter is installed and working", function()
    local treesitter_installed = is_treesitter_installed()
    assert.are.same(true, treesitter_installed)
  end)

  it("should check if the Ruby parser is installed and working", function()
    local ruby_parser_installed = is_ruby_parser_installed()
    assert.are.same(true, ruby_parser_installed)
  end)
end)
