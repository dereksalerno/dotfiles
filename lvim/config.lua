-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Example configs: https://github.com/LunarVim/starter.lvim
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny
lvim.keys.normal_mode["<S-h>"] = "<cmd>bprevious<cr>"
lvim.keys.normal_mode["<S-l>"] = "<cmd>bnext<cr>"

lvim.keys.normal_mode["<C-h>"] = "<Cmd>NvimTmuxNavigateLeft<CR>"
lvim.keys.normal_mode["<C-j>"] = "<Cmd>NvimTmuxNavigateDown<CR>"
lvim.keys.normal_mode["<C-k>"] = "<Cmd>NvimTmuxNavigateUp<CR>"
lvim.keys.normal_mode["<C-l>"] = "<Cmd>NvimTmuxNavigateRight<CR>"
lvim.keys.normal_mode["<C-bb>"] = "<Cmd>NvimTmuxNavigateLastActive<CR>"
lvim.keys.normal_mode["<C-Space>"] = "<Cmd>NvimTmuxNavigateNavigateNext<CR>"
-- custom keymaps
lvim.keys.normal_mode["<leader>cj"] = "<cmd>%!jq .<cr>"
lvim.keys.normal_mode["<leader>ct"] = "<cmd>retab<cr>"



lvim.keys.normal_mode["<C-u>"] = "<C-u>zz"
lvim.keys.normal_mode["<C-d>"] = "<C-d>zz"
lvim.keys.normal_mode["<C-k>"] = "<cmd>cnext<CR>zz"
lvim.keys.normal_mode["<C-j>"] = "<cmd>cprev<CR>zz"
lvim.keys.normal_mode["<leader>k"] = "<cmd>lnext<CR>zz"
lvim.keys.normal_mode["<leader>j"] = "<cmd>lprev<CR>zz"
lvim.keys.normal_mode["n"] = "nzzzv"
lvim.keys.normal_mode["N"] = "Nzzzv"
lvim.keys.normal_mode["*"] = "*zzzv"
lvim.keys.normal_mode["J"] = "mzJ`z"
lvim.keys.normal_mode["<leader>y"] = [["+y]]
lvim.keys.normal_mode["<leader>d"] = [["_d]]
lvim.keys.normal_mode["<C-u>"] = "<C-u>zz"
lvim.keys.normal_mode["<C-d>"] = "<C-d>zz"
lvim.keys.normal_mode["<C-k>"] = "<cmd>cnext<CR>zz"
lvim.keys.normal_mode["<C-j>"] = "<cmd>cprev<CR>zz"
lvim.keys.normal_mode["<leader>k"] = "<cmd>lnext<CR>zz"
lvim.keys.normal_mode["<leader>j"] = "<cmd>lprev<CR>zz"
lvim.keys.normal_mode["n"] = "nzzzv"
lvim.keys.normal_mode["N"] = "Nzzzv"
lvim.keys.normal_mode["*"] = "*zzzv"
lvim.keys.normal_mode["J"] = "mzJ`z"

lvim.keys.visual_mode["J"] = ":m '>+1<CR>gv=gv"
lvim.keys.visual_mode["K"] = ":m '<-2<CR>gv=gv"
lvim.keys.visual_mode["<leader>y"] = [["+y]]
lvim.keys.visual_mode["<leader>d"] = [["_d]]

lvim.keys.visual_block_mode["<leader>p"] = [["_dP]]

local function copy(lines, _)
  require('osc52').copy(table.concat(lines, '\n'))
end

local function paste()
  return {vim.fn.split(vim.fn.getreg(''), '\n'), vim.fn.getregtype('')}
end

vim.g.clipboard = {
  name = 'osc52',
  copy = {['+'] = copy, ['*'] = copy},
  paste = {['+'] = paste, ['*'] = paste},
}


vim.opt.shiftwidth = 2 -- the number of spaces inserted for each indentation
vim.opt.tabstop = 2 -- insert 2 spaces for a tab
vim.opt.relativenumber = true -- relative line numbers
vim.opt.wrap = true -- wrap lines


vim.opt.foldopen = "all"
vim.opt.foldlevel = 40
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

lvim.plugins = {
  -- { "lunarvim/colorschemes" },
  {
    "stevearc/dressing.nvim",
    config = function()
      require("dressing").setup({
        input = { enabled = false },
      })
    end,
  },
    {
    "nvim-neorg/neorg",
    -- lazy-load on filetype
    build = ":Neorg sync-parsers",
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
  {
    "ojroques/nvim-osc52",
    lazy = false,
    config = function()
      require("osc52").setup({
        max_length = 0, -- Maximum length of selection (0 for no limit)
        silent = true, -- Disable message on successful copy
        trim = false, -- Trim surrounding whitespaces before copy
      })
    end,
  },
    {
    "nvim-pack/nvim-spectre",
    -- stylua: ignore
    keys = {
      { "<leader>sr", function() require("spectre").open() end, desc = "Replace in files (Spectre)" },
    },
  },
  {
    "ThePrimeagen/harpoon",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<Leader>ha", '<cmd>lua require("harpoon.mark").add_file()<CR>', desc = "Add Harpoon File"  },
      { "<Leader>ht", '<cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>', desc = "Toggle Harpoon Menu"  },
      { "<Leader>hn", '<cmd>lua require("harpoon.ui").nav_next()<CR>', desc = "Harpoon Previos"  },
      { "<Leader>hp", '<cmd>lua require("harpoon.ui").nav_prev()<CR>', desc = "Harpoon Next"  },
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
        next = "<C-Space>",
      },
    })
  end,
},
    -- session management
  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    opts = { options = { "buffers", "curdir", "tabpages", "winsize", "help", "globals" } },
    -- stylua: ignore
    keys = {
      { "<leader>qs", function() require("persistence").load() end, desc = "Restore Session" },
      { "<leader>ql", function() require("persistence").load({ last = true }) end, desc = "Restore Last Session" },
      { "<leader>qd", function() require("persistence").stop() end, desc = "Don't Save Current Session" },
    },
  },

  -- library used by other plugins
  { "nvim-lua/plenary.nvim", lazy = true },
  -- makes some plugins dot-repeatable like leap
  { "tpope/vim-repeat", event = "VeryLazy" },
    {
    "telescope.nvim",
    dependencies = {
      -- project management
      {
        "ahmedkhalf/project.nvim",
        opts = {},
        event = "VeryLazy",
        config = function(_, opts)
          require("project_nvim").setup(opts)
          require("telescope").load_extension("projects")
        end,
        keys = {
          { "<leader>fp", "<Cmd>Telescope projects<CR>", desc = "Projects" },
        },
      },
    },
  },

}
