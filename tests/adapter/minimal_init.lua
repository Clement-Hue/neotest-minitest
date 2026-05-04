vim.o.swapfile = false
vim.bo.swapfile = false

vim.cmd([[set runtimepath+=.]])
vim.cmd([[set runtimepath+=./misc/neotest]])
vim.cmd([[set runtimepath+=./misc/nio]])
vim.cmd([[set runtimepath+=./misc/plenary]])
vim.cmd([[set runtimepath+=./misc/treesitter]])

local function install_ruby_parser()
  local treesitter = require("nvim-treesitter")
  treesitter.install({ "ruby" }):wait(300000)
end

install_ruby_parser()

require("neotest").setup({
  adapters = {
    require("neotest-minitest"),
  },
})
