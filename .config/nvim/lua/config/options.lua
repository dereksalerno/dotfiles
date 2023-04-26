-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.cmd([[
    let g:clipboard = {
          \   'name': 'tmux',
          \   'copy': {
          \      '+': ['tmux', 'load-buffer', '-'],
          \      '*': ['tmux', 'load-buffer', '-'],
          \    },
          \   'paste': {
          \      '+': ['tmux', 'save-buffer', '-'],
          \      '*': ['tmux', 'save-buffer', '-'],
          \   },
          \   'cache_enabled': 1,
          \ }
]])

vim.g.nord_contrast = true
vim.g.nord_borders = false
vim.g.nord_disable_background = false
