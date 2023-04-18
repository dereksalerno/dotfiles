local M = {
	"nvim-telescope/telescope.nvim",
	event = "BufReadPre",
	dependencies = {
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		{ "nvim-telescope/telescope-ui-select.nvim" },
		{ "debugloop/telescope-undo.nvim" },
		{   'camgraff/telescope-tmux.nvim',
    	dependencies = {
      'norcalli/nvim-terminal.lua',
		}
    },
	},
	keys = {
		{ "<leader>?", function() require('telescope.builtin').oldfiles() end,  desc = "[?] Find recently opened files" },
		{ "<leader><space>", function() require('telescope.builtin').buffers() end,  desc = "[ ] Find existing buffers"  },
		{ "<leader>tk", function() require('telescope.builtin').keymaps() end, desc = "[tk] List all keymaps" },
		{
			"<leader>/",
		  function() require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown()) end,
			desc = "[/] Fuzzily search in current buffer]"
		},
		{ "<leader>sf", function() require('telescope.builtin').find_files() end,  desc = "[S]earch [F]iles" },
		{ "<leader>sh", function() require('telescope.builtin').help_tags() end,  desc = "[S]earch [H]elp" },
		{ "<leader>sw", function() require('telescope.builtin').grep_string() end,  desc = "[S]earch current [W]ord" },
		{ "<leader>sg", function() require('telescope.builtin').live_grep() end,  desc = "[S]earch by [G]rep" },
		{ "<leader>sd", function() require('telescope.builtin').diagnostics() end,  desc = "[S]earch [D]iagnostics" },

		{
			"<leader>ts",
			function() require('telescope').extensions.tmux.sessions {}() end,
	 		 desc = "[T]mux [S]essions",
		},

		{
			"<leader>tw", 
			function() require('telescope').extensions.tmux.windows {}() end,
		  desc = "[T]mux [W]indows",
		},

		{
			"<leader>tp", 
			function() require('telescope').extensions.tmux.pane_contents {}() end,
		  desc = "[T]mux [P]ane_Contents",
		},

--		{ "<C-M-o>", function() require('telescope.builtin').find_files()() end },
--		{
--			"<C-M-p>",
--			function() require('telescope.builtin').builtin(require('telescope.themes').get_dropdown({}))() end,
--		},
--		{ "<C-g>", function() require('telescope.builtin').live_grep()() end },
--		{ "<C-f>", function() require('telescope.builtin').current_buffer_fuzzy_find()() end },
	},
	opts = function()
		local actions = require("telescope.actions")
		local theme = require("telescope.themes")
		return {
			pickers = {
				find_files = { hidden = true },
				live_grep = {
					additional_args = function(opts)
						return { "--hidden" }
					end,
				},
			},
			defaults = {
				mappings = { i = { ["<esc>"] = actions.close } },
			},

			extensions = {
				fzf = {
					fuzzy = true, -- false will only do exact matching
					override_generic_sorter = true, -- override the generic sorter
					override_file_sorter = true, -- override the file sorter
					case_mode = "smart_case", -- or "ignore_case" or "respect_case"
					-- the default case_mode is "smart_case"
				},
				["ui-select"] = {
					theme.get_dropdown({
						-- even more opts
					}),
				},
			},
		}
	end,
	config = function(_, opts)
		local telescope = require("telescope")
		telescope.setup(opts)
require("telescope").load_extension("undo")
		telescope.load_extension("fzf")
		telescope.load_extension("ui-select")
		telescope.load_extension("tmux")
	end,
}

return M

