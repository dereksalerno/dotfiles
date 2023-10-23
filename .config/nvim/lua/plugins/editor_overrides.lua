return {
  {
    "sindrets/diffview.nvim",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("diffview").setup({})
    end,
  },
  {
    "ThePrimeagen/harpoon",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<Leader>ha", '<cmd>lua require("harpoon.mark").add_file()<CR>', desc = "Add Harpoon File" },
      { "<Leader>ht", '<cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>', desc = "Toggle Harpoon Menu" },
      { "<Leader>hn", '<cmd>lua require("harpoon.ui").nav_next()<CR>', desc = "Harpoon Previous" },
      { "<Leader>hp", '<cmd>lua require("harpoon.ui").nav_prev()<CR>', desc = "Harpoon Next" },
    },
  },
  {
    "f-person/git-blame.nvim",
    cmd = "GitBlameToggle",
    keys = { { "<Leader>gb", "<cmd>GitBlameToggle<CR>", desc = "Toggle Git Blame" } },
    config = function()
      vim.g["gitblame_date_format"] = "%r" -- relative date
      vim.g["gitblame_enabled"] = 0 -- default disabled
    end,
  },
  { "tpope/vim-fugitive"},
  {
    "akinsho/git-conflict.nvim",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("git-conflict").setup({
        default_mappings = {
          ours = "o",
          theirs = "t",
          none = "0",
          both = "b",
          next = "n",
          prev = "p",
        },
        default_commands = true, -- disable commands created by this plugin
        disable_diagnostics = false, -- This will disable the diagnostics in a buffer whilst it is conflicted
        highlights = { -- They must have background color, otherwise the default color will be used
          incoming = "DiffText",
          current = "DiffAdd",
        },
      })
    end,
  },
}
