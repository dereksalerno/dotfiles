return {
  {
    "nvim-neorg/neorg",
    -- lazy-load on filetype
    run = ":Neorg sync-parsers",
    ft = "norg",
    cmd = "Neorg",
    priority = 30,
    -- options for neorg. This will automatically call `require("neorg").setup(opts)`
    config = function()
      require("neorg").setup({
        load = {
          ["core.defaults"] = {},
          ["core.completion"] = {},
          ["core.concealer"] = {},
          ["core.export"] = {},
          ["core.export.markdown"] = {},
          ["core.manoeuvre"] = {},
          ["core.presenter"] = {},
          ["core.summary"] = {},
          ["core.dirman"] = {
            config = {
              workspaces = {
                work = "~/.notes/work",
                home = "~/.notes/home",
              },
            },
          },
        },
      })
    end,
  },
}
