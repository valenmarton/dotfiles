return {
    "nvimdev/lspsaga.nvim",
    dependencies = {
        'nvim-treesitter/nvim-treesitter', -- optional
        'nvim-tree/nvim-web-devicons',     -- optional
    },
    config = function()
        require('lspsaga').setup({
            ui = {
                code_action = ''
            },
            symbol_in_winbar = {
                enable = false
            },
            mappings = {
                vim.keymap.set("n", "gp", "<cmd>Lspsaga peek_type_definition<cr>")
            }
        })
    end,
}
