return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local treesitter_config = require("nvim-treesitter.configs")

    treesitter_config.setup({
      ensure_install = {"help", "javascript", "typescript", "c", "cpp,", "json", "lua"},
      auto_install = true,
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end
}
