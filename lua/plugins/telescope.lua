return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	-- or                              , branch = '0.1.x',
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local actions = require("telescope.actions")

		require("telescope").setup({
			defaults = {
				-- layout_config = {
				--     vertical = { width = 0.8 },
				-- },
				layout_strategy = "vertical",
				-- pickers = {
				--     find_files =
				--
				-- },
				mappings = {
					i = {
						["<C-j>"] = actions.move_selection_next,
						["<C-k>"] = actions.move_selection_previous,
					},
				},
			},
		})

		local builtin = require("telescope.builtin")

		-- vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
		vim.keymap.set("n", "<C-p>", builtin.find_files, {})
		vim.keymap.set("n", "<leader><leader>", builtin.git_files, {})
		vim.keymap.set("n", "<leader>sw", builtin.grep_string, {})
		vim.keymap.set("n", "<leader>ps", function()
			builtin.grep_string({ search = vim.fn.input("Grep > ") })
		end)

		vim.keymap.set("n", "<leader>gs", builtin.git_status, {})
		vim.keymap.set("n", "<leader>ht", builtin.help_tags, {})
		vim.keymap.set("n", "<leader>ws", builtin.lsp_workspace_symbols, {})
		vim.keymap.set("n", "<leader>ds", builtin.lsp_document_symbols, {})
		vim.keymap.set("n", "<leader>km", builtin.keymaps, {})
		vim.keymap.set("n", "<leader>of", builtin.oldfiles, {})
		vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<cr>", opts)
		vim.keymap.set("n", "gi", "<cmd>Telescope lsp_definitions<cr>", opts)
		-- Change colorscheme
		vim.keymap.set("n", "<leader>cs", "<cmd>Telescope colorscheme<cr>", opts)

		-- vim.keymap.set("n", "<leader>sw", function()
		-- 	local word = vim.fn.expand("<cword>")
		-- 	builtin.grep_string({ search = word })
		-- end)

		vim.keymap.set("n", "<leader>sW", function()
			local word = vim.fn.expand("<cWORD>")
			builtin.grep_string({ search = word })
		end)

		vim.keymap.set("n", "<leader>sr", builtin.oldfiles, {}) --search recent

		-- <leader>sr could be search references, currently in lsp config (gr)

		vim.keymap.set("n", "<leader>ss", builtin.lsp_document_symbols, {}) --search symbols

		vim.keymap.set("n", "<leader>,", function()
			builtin.buffers({ sort_mru = true, ignore_current_buffer = true })
		end)

		vim.keymap.set("n", "<leader>.", builtin.current_buffer_fuzzy_find, {})
		vim.keymap.set("n", "<leader>/", builtin.live_grep, {})
	end,
}
