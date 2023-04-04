-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  is_bootstrap = true
  vim.fn.system { 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path }
  vim.cmd [[packadd packer.nvim]]
end

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require('packer').startup(function(use)
  -- Package manager
  use 'wbthomason/packer.nvim'

  use { -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    requires = {
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      'j-hui/fidget.nvim',

      -- Additional lua configuration, makes nvim stuff amazing
      'folke/neodev.nvim',
    },
  }

  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly'                  -- optional, updated every week. (see issue #1193)
  }

  use {
    'camgraff/telescope-tmux.nvim',
    requires = {
      'norcalli/nvim-terminal.lua',
    },
  }
  use('mbbill/undotree')
  use('pearofducks/ansible-vim')

  use { -- Autocompletion
    'hrsh7th/nvim-cmp',
    requires = { 'hrsh7th/cmp-nvim-lsp', 'hrsh7th/cmp-buffer', 'hrsh7th/cmp-path', 'hrsh7th/cmp-cmdline',
      'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
  }

  use { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    run = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
  }

  use { -- Additional text objects via treesitter
    'nvim-treesitter/nvim-treesitter-textobjects',
    after = 'nvim-treesitter',
  }

  -- Git related plugins
  use 'tpope/vim-fugitive'
  use 'tpope/vim-rhubarb'
  use 'lewis6991/gitsigns.nvim'

  -- Colorschemes to choose from
  use 'navarasu/onedark.nvim'          -- Theme inspired by Atom
  use 'shaeinst/roshnivim-cs'          -- Colorscheme written in Lua, specially made for roshnivim with Tree-sitter support.
  use 'tomasiser/vim-code-dark'        -- A dark color scheme heavily inspired by the look of the Dark+ scheme of Visual Studio Code.
  use 'Mofiqul/vscode.nvim'            -- A Lua port of vim-code-dark colorscheme with vscode light and dark theme.
  use 'bluz71/vim-nightfly-colors'     -- A dark midnight colorscheme with modern Neovim support including Tree-sitter.
  use 'bluz71/vim-moonfly-colors'      -- A dark charcoal colorscheme with modern Neovim support including Tree-sitter.
  use 'folke/tokyonight.nvim'          -- A clean, dark and light Neovim theme written in Lua, with support for LSP, Tree-sitter and lots of plugins.
  use 'sainnhe/sonokai'                -- High Contrast & Vivid Color Scheme based on Monokai Pro.
  use 'nyoom-engineering/oxocarbon'    -- A dark and light Neovim theme written in fennel, inspired by IBM Carbon.
  use 'kyazdani42/blue-moon'           -- A dark color scheme derived from palenight and carbonight.
  use 'mhartington/oceanic-next'       -- Oceanic Next theme.
  use 'jim-at-jibba/ariake-vim-colors' -- A port of the great Atom theme. Dark and light with Tree-sitter support.
  use 'ishan9299/modus-theme-vim'      -- This is a color scheme developed by Protesilaos Stavrou for emacs.
  use 'sainnhe/edge'                   -- Clean & Elegant Color Scheme inspired by Atom One and Material.
  use 'theniceboy/nvim-deus'           -- Vim-deus with Tree-sitter support.
  use 'bkegley/gloombuddy'             -- Gloom inspired theme.
  use 'PHSix/nvim-hybrid'              -- A Neovim colorscheme write in Lua.
  use 'ray-x/aurora'                   -- A 24-bit dark theme with Tree-sitter and LSP support.
  use 'savq/melange'                   -- Warm colorscheme written in Lua with support for various terminal emulators.
  use 'RRethy/nvim-base16'             -- Neovim plugin for building base16 colorschemes. Includes support for Treesitter and LSP highlight groups.
  use 'fenetikm/falcon'                -- A colour scheme for terminals, Vim and friends.
  use 'shaunsingh/nord.nvim'           -- Neovim theme based off of the Nord Color Palette.
  use 'svrana/neosolarized.nvim'       -- Dark solarized colorscheme using colorbuddy for easy customization.
  use 'ishan9299/nvim-solarized-lua'   -- Solarized colorscheme in Lua (Neovim >= 0.5).
  use 'shaunsingh/moonlight.nvim'      -- Port of VSCode's Moonlight colorscheme, written in Lua with built-in support for native LSP, Tree-sitter and many more plugins.
  use 'lourenci/github-colors'         -- GitHub colors leveraging Tree-sitter to get 100% accuracy.
  use 'sainnhe/gruvbox-material'       -- Gruvbox modification with softer contrast and Tree-sitter support.
  use 'sainnhe/everforest'             -- A green based colorscheme designed to be warm, soft and easy on the eyes.
  use 'neanias/everforest'             -- A Lua port of the Everforest colour scheme.
  use 'NTBBloodbath/doom-one.nvim'     -- Lua port of doom-emacs' doom-one.
  use 'dracula/vim'                    -- Famous beautiful dark powered theme.
  use 'Mofiqul/dracula.nvim'           -- Dracula colorscheme for neovim written in Lua.
  use 'yashguptaz/calvera-dark.nvim'   -- A port of [VSCode Calvara Dark](https://github.com/saurabhdaware/vscode-calvera-dark) Theme to Neovim with Tree-sitter and many other plugins support.
  use 'nxvu699134/vn-night'            -- A dark Neovim colorscheme written in Lua. Support built-in LSP and Tree-sitter.
  use 'adisen99/codeschool.nvim'       -- Codeschool colorscheme written in Lua with Tree-sitter and built-in lsp support.
  use 'projekt0n/github-nvim-theme'    -- A GitHub theme, kitty, alacritty written in Lua. Support built-in LSP and Tree-sitter.
  use 'kdheepak/monochrome.nvim'       -- A 16 bit monochrome colorscheme that uses hsluv for perceptually distinct gray colors, with support for Tree-sitter and other commonly used plugins.
  use 'rose-pine/neovim'               -- All natural pine, faux fur and a bit of soho vibes for the classy minimalist.
  use 'mcchrish/zenbones.nvim'         -- A collection of Vim/Neovim colorschemes designed to highlight code using contrasts and font variations.
  use 'FrenzyExists/aquarium-vim'      -- A dark, yet vibrant colorscheme.
  use 'ldelossa/vimdark'               -- A minimal Vim theme for night time. Loosely based on vim-monotonic and chrome's dark reader extension. A light theme is included as well for the day time.
  use 'Everblush/everblush'            -- A dark, vibrant and beautiful colorscheme written in Lua.
  use 'RishabhRD/gruvy'                -- Gruvbuddy without colorbuddy using Lush.
  use 'luisiacc/gruvbox-baby'          -- A modern gruvbox theme with full treesitter support.
  use 'titanzero/zephyrium'            -- A zephyr-esque theme, written in Lua, with TreeSitter support.
  use 'kaiuri/nvim-juliana'            -- Port of Sublime's Mariana Theme to Neovim for short attention span developers with Tree-sitter support.
  use 'lmburns/kimbox'                 -- A colorscheme with a dark background, and vibrant foreground that is centered around the color brown. A modification of [Kimbie Dark](https://marketplace.visualstudio.com/items?itemName=dnamsons.kimbie-dark-plus).
  use 'rockyzhang24/arctic'            -- A Neovim colorscheme ported from VSCode Dark+ theme with the strict and precise color picking for both the editor and UI.
  use 'ramojus/mellifluous.nvim'       -- Pleasant and productive colorscheme.
  use 'Yazeed1s/minimal.nvim'          -- Two tree-sitter supported colorschemes that are inspired by base16-tomorrow-night and monokai-pro.
  use 'lewpoly/sherbet.nvim'           -- A soothing colorscheme with support for popular plugins and tree-sitter.
  use 'Mofiqul/adwaita.nvim'           -- Colorscheme based on GNOME Adwaita syntax with support for popular plugins.
  use 'kvrohit/mellow.nvim'            -- A soothing dark color scheme with tree-sitter support.
  use 'embark-theme/vim'               -- A deep inky purple theme leveraging bright colors.


  use 'nvim-lualine/lualine.nvim'           -- Fancier statusline
  use 'lukas-reineke/indent-blankline.nvim' -- Add indentation guides even on blank lines
  use 'numToStr/Comment.nvim'               -- "gc" to comment visual regions/lines
  use 'tpope/vim-sleuth'                    -- Detect tabstop and shiftwidth automatically
  use 'roxma/vim-tmux-clipboard'            -- Tmux system clipboard compatibility

  -- Fuzzy Finder (files, lsp, etc)
  use { 'nvim-telescope/telescope.nvim', branch = '0.1.x', requires = { 'nvim-lua/plenary.nvim' } }

  -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 }
  -- terminal highlighing for telescope tmux plugin
  -- use('norcalli/nvim-terminal.lua')
  -- require'terminal'.setup()


  -- Add custom plugins to packer from ~/.config/nvim/lua/custom/plugins.lua
  local has_plugins, plugins = pcall(require, 'custom.plugins')
  if has_plugins then
    plugins(use)
  end

  if is_bootstrap then
    require('packer').sync()
  end
end)

--
-- You'll need to restart nvim, and then it will work.
if is_bootstrap then
  print '=================================='
  print '    Plugins are being installed'
  print '    Wait until Packer completes,'
  print '       then restart nvim'
  print '=================================='
  return
end

-- Automatically source and re-compile packer whenever you save this init.lua
local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
  command = 'source <afile> | silent! LspStop | silent! LspStart | PackerCompile',
  group = packer_group,
  pattern = vim.fn.expand '$MYVIMRC',
})

-- adapted from https://github.com/ethanholz/nvim-lastplace/blob/main/lua/nvim-lastplace/init.lua
local ignore_buftype = { "quickfix", "nofile", "help" }
local ignore_filetype = { "gitcommit", "gitrebase", "svn", "hgcommit" }

local function run()
  if vim.tbl_contains(ignore_buftype, vim.bo.buftype) then
    return
  end

  if vim.tbl_contains(ignore_filetype, vim.bo.filetype) then
    -- reset cursor to first line
    vim.cmd [[normal! gg]]
    return
  end

  -- If a line has already been specified on the command line, we are done
  --   nvim file +num
  if vim.fn.line(".") > 1 then
    return
  end

  local last_line = vim.fn.line([['"]])
  local buff_last_line = vim.fn.line("$")

  -- If the last line is set and the less than the last line in the buffer
  if last_line > 0 and last_line <= buff_last_line then
    local win_last_line = vim.fn.line("w$")
    local win_first_line = vim.fn.line("w0")
    -- Check if the last line of the buffer is the same as the win
    if win_last_line == buff_last_line then
      -- Set line to last line edited
      vim.cmd [[normal! g`"]]
      -- Try to center
    elseif buff_last_line - last_line > ((win_last_line - win_first_line) / 2) - 1 then
      vim.cmd [[normal! g`"zz]]
    else
      vim.cmd [[normal! G'"<c-e>]]
    end
  end
end

vim.api.nvim_create_autocmd({ 'BufWinEnter', 'FileType' }, {
  group    = vim.api.nvim_create_augroup('nvim-lastplace', {}),
  callback = run
})

-- [[ Setting options ]]
-- See `:help vim.o`

-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers default
vim.wo.number = true
vim.opt.relativenumber = true
-- Enable mouse mode
vim.o.mouse = ''

vim.o.tabstop = 2
vim.o.shiftwidth = 2

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'

-- Set colorscheme
vim.o.termguicolors = true
vim.cmd [[colorscheme rose-pine]]


-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- [[ Basic Keymaps ]]
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

vim.opt.clipboard = "unnamedplus"

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])


vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "*", "*zzzv")
vim.keymap.set("n", "J", "mzJ`z")
-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`

local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

require 'terminal'.setup()
-- Set lualine as statusline
-- See `:help lualine.txt`
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'rose-pine',
    component_separators = '|',
    section_separators = '',
  },
}

-- Enable nvim-tree
require("nvim-tree").setup {
  actions = {
    open_file = {
      quit_on_open = true
    }
  }
}
vim.keymap.set('n', '<C-f>', ':NvimTreeToggle<CR>', { noremap = true })

-- Enable Comment.nvim
require('Comment').setup()

-- Enable `lukas-reineke/indent-blankline.nvim`
-- See `:help indent_blankline.txt`
require('indent_blankline').setup {
  char = '┊',
  show_trailing_blankline_indent = false,
}

-- Gitsigns
-- See `:help gitsigns.txt`
require('gitsigns').setup {
  signs = {
    add = { text = '+' },
    change = { text = '~' },
    delete = { text = '_' },
    topdelete = { text = '‾' },
    changedelete = { text = '~' },
  },
}

-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
require('telescope').setup {
  pickers = {
    colorscheme = {
      enable_preview = true
    }
  },
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
  },
}

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')
-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>tk', require('telescope.builtin').keymaps, { desc = '[tk] List all keymaps' })
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer]' })

vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })

vim.keymap.set('n', '<leader>ts', function()
  require('telescope').extensions.tmux.sessions {}
end, { desc = '[T]mux [S]essions' })

vim.keymap.set('n', '<leader>tw', function()
  require('telescope').extensions.tmux.windows {}
end, { desc = '[T]mux [W]indows' })

vim.keymap.set('n', '<leader>tp', function()
  require('telescope').extensions.tmux.pane_contents {}
end, { desc = '[T]mux [P]ane_Contents' })

--
-- [[ Configure Treesitter ]]
-- See `:help nvim-treesitter`
require('nvim-treesitter.configs').setup {
  -- Add languages to be installed here that you want installed for treesitter
  ensure_installed = { 'c', 'cpp', 'go', 'lua', 'python', 'rust', 'typescript', 'help', 'vim' },

  highlight = { enable = true },
  indent = { enable = true, disable = { 'python' } },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<c-space>',
      node_incremental = '<c-space>',
      scope_incremental = '<c-s>',
      node_decremental = '<c-backspace>',
    },
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ['aa'] = '@parameter.outer',
        ['ia'] = '@parameter.inner',
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        [']m'] = '@function.outer',
        [']]'] = '@class.outer',
      },
      goto_next_end = {
        [']M'] = '@function.outer',
        [']['] = '@class.outer',
      },
      goto_previous_start = {
        ['[m'] = '@function.outer',
        ['[['] = '@class.outer',
      },
      goto_previous_end = {
        ['[M'] = '@function.outer',
        ['[]'] = '@class.outer',
      },
    },
    swap = {
      enable = true,
      swap_next = {
        ['<leader>a'] = '@parameter.inner',
      },
      swap_previous = {
        ['<leader>A'] = '@parameter.inner',
      },
    },
  },
}

-- Diagnostic keymaps & opts
vim.diagnostic.config({
  float = {
    source = 'always',
  },
})
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

-- LSP settings.
--  This function gets run when an LSP connects to a particular buffer.
local on_attach = function(_, bufnr)
  -- NOTE: Remember that lua is a real programming language, and as such it is possible
  -- to define small helper and utility functions so you don't have to repeat yourself
  -- many times.
  --
  -- In this case, we create a function that lets us more easily define mappings specific
  -- for LSP related items. It sets the mode, buffer and description for us each time.
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

  nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
  nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
  nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
  nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
  nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
  nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

  -- See `:help K` for why this keymap
  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

  -- Lesser used LSP functionality
  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
  nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
  nmap('<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, '[W]orkspace [L]ist Folders')

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer with LSP' })
end

-- Enable the following language servers
--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
--
--  Add any additional override configuration in the following tables. They will be passed to
--  the `settings` field of the server config. You must look up that documentation yourself.
local servers = {
  pylsp = {
    plugins = {
      pycodestyle = {
        ignore = { 'E111', 'E501' },
      }
    }
  },
  -- clangd = {},
  -- gopls = {},
  -- pyright = {},
  -- rust_analyzer = {},
  -- tsserver = {},

  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
}

-- Setup neovim lua configuration
require('neodev').setup()
--
-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Setup mason so it can manage external tooling
require('mason').setup()

-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
  function(server_name)
    require('lspconfig')[server_name].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = servers[server_name],
    }
  end,
}

-- Turn on lsp status information
require('fidget').setup()

-- nvim-cmp setup
local cmp = require 'cmp'
local luasnip = require 'luasnip'

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
