return {
    "lewis6991/gitsigns.nvim",
    opts = {},
    config = function()
        require("gitsigns").setup({
            vim.keymap.set("n", "<leader>gb", "<cmd>Gitsigns toggle_current_line_blame<cr>")
        })
    end
}
