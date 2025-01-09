return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    -- or                              , branch = '0.1.x',
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = 'make' },
    },
    config = function()
        local actions = require("telescope.actions")

        require("telescope").setup({
            extensions = {
                fzf = {
                    fuzzy = true,                   -- false will only do exact matching
                    override_generic_sorter = true, -- override the generic sorter
                    override_file_sorter = true,    -- override the file sorter
                    case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
                    -- the default case_mode is "smart_case"
                },
            },
            defaults = {
                layout_config = {
                    vertical = { width = 0.8 },
                    horizontal = { width = 0.8 },
                    -- prompt_position = "top",
                    -- mirror = true,
                },
                layout_strategy = "horizontal",
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
        -- To get fzf loaded and working with telescope, you need to call
        -- load_extension, somewhere after setup function:
        require('telescope').load_extension('fzf')


        local builtin = require("telescope.builtin")

        -- search for hidden files too
        vim.keymap.set("n", "<C-p>", function()
            builtin.find_files({
                hidden = true,                      -- Include hidden files (files starting with a dot)
                no_ignore = true,                   -- Don't ignore files based on `.gitignore` or similar
                prompt_prefix = 'All files > ',     -- Custom title for the picker
                find_command = {                    -- Custom find command to exclude node_modules
                    'rg',                           -- Use ripgrep for faster searching
                    '--files',                      -- List files
                    '--hidden',                     -- Include hidden files
                    '--glob', '!**/node_modules/*', -- Exclude node_modules directory
                    '--glob', '!**/.git/*',
                }
            })
        end, {})
        -- find directories
        vim.keymap.set("n", "<leader>fd", function()
            builtin.find_files({
                -- hidden = true,                    -- Include hidden files (files starting with a dot)
                prompt_prefix = 'Directories > ',            -- Custom title for the picker
                -- :Telescope fd find_command=fd,-t=d
                find_command = { 'find', '.', '-type', 'd' } -- only find directories
            })
        end, {})
        vim.keymap.set("n", "<leader>sql", builtin.quickfix, {})
        vim.keymap.set("n", "<leader>sqh", builtin.quickfixhistory, {})
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
        vim.keymap.set("n", "<leader>ls", "<cmd>Telescope resume<cr>", opts)
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
        vim.keymap.set("n", "<leader>/", function()
            builtin.live_grep({})
        end)
    end,
}
