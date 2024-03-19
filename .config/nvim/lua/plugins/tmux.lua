return {
  {
  "sanathks/workspace.nvim",
  dependencies = {"nvim-telescope/telescope.nvim"},
  config = function()
    require("workspace").setup({
      workspaces = {
        { name = "bin", path = "~/bin", keymap = { "<leader>tp" } },
        { name = "neovim", path = "~/.config/nvim", keymap = { "<leader>nc" } },
      }
    })
  end,
  },
  {
  "alexghergh/nvim-tmux-navigation",
  event = "VeryLazy",
  config = function()
    local nvim_tmux_nav = require("nvim-tmux-navigation")
    nvim_tmux_nav.setup({
      disable_when_zoomed = true,
      -- defaults to false
      keybindings = {
        left = "<C-h>",
        down = "<C-j>",
        up = "<C-k>",
        right = "<C-l>",
      },
    })
  end,
  },
}
