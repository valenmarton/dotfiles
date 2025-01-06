return {
    -- the colorscheme should be available when starting Neovim
    {
        "rose-pine/neovim",
        lazy = false,    -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        name = "rose-pine",
        config = function()
            require('rose-pine').setup {
                styles = {
                    italic = false
                }
            }
            -- load the colorscheme here
            -- vim.cmd([[colorscheme rose-pine]])
        end,
    },
    {
        "sainnhe/gruvbox-material",
        config = function()
            -- vim.cmd([[colorscheme gruvbox-material]])
        end
    },
    { "folke/tokyonight.nvim" },
    {
        "xiantang/darcula-dark.nvim",
        config = function()
            vim.cmd([[colorscheme tokyonight]])
        end
    },
    {
        "vague2k/vague.nvim",
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        config = function()
            -- vim.cmd [[colorscheme catppuccin]]
        end
    },
    { "stevearc/dressing.nvim" },
    -- I have a separate config.mappings file where I require which-key.
    -- With lazy the plugin will be automatically loaded when it is required somewhere
    { "folke/which-key.nvim",  lazy = true },
    { "folke/zen-mode.nvim" },
    {
        "dstein64/vim-startuptime",
        -- lazy-load on a command
        cmd = "StartupTime",
        -- init is called during startup. Configuration for vim plugins typically should be set in an init function
        init = function()
            vim.g.startuptime_tries = 10
        end,
    },
    {
        "Wansmer/treesj",
        keys = {
            { "J", "<cmd>TSJToggle<cr>", desc = "Join Toggle" },
        },
        opts = { use_default_keymaps = false, max_join_length = 150 },
    },

    {
        "monaqa/dial.nvim",
        enabled = false,
        -- lazy-load on keys
        -- mode is `n` by default. For more advanced options, check the section on key mappings
        keys = { "<C-a>", { "<C-x>", mode = "n" } },
    },
    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end,
    },

    -- if some code requires a module from an unloaded plugin, it will be automatically loaded.
    -- So for api plugins like devicons, we can always set lazy=true
    -- { "nvim-tree/nvim-web-devicons", lazy = true },

    -- you can use the VeryLazy event for things that can
    -- load later and are not important for the initial UI
    -- { "stevearc/dressing.nvim",      event = "VeryLazy" },

    -- local plugins need to be explicitly configured with dir
    -- { dir = "~/projects/secret.nvim" },

    -- you can use a custom url to fetch a plugin
    -- { url = "git@github.com:folke/noice.nvim.git" },

    -- local plugins can also be configured with the dev option.
    -- This will use {config.dev.path}/noice.nvim/ instead of fetching it from GitHub
    -- With the dev option, you can easily switch between the local and installed version of a plugin
    -- { "folke/noice.nvim",                         dev = true },
}
