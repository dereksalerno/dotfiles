return {
  {
    "folke/noice.nvim",
    opts = {
      lsp = {
        override = {
          ["cmp.entry.get_documentation"] = true,
        },
      },
    },
  },
  {
    "folke/trouble.nvim",
    -- opts will be merged with the parent spec
    opts = { use_diagnostic_signs = true },
  },
  {
  "folke/which-key.nvim",
  optional = true,
  opts = {
    defaults = {
      ["<leader>d"] = { name = "+debug" },
      ["<leader>da"] = { name = "+adapters" },
    },
  },
},
}
