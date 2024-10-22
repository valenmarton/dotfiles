return {
    "ThePrimeagen/harpoon",
    config = function()
        require("harpoon").setup({
            tabline = false,
        })
        local harpoon_ui = require("harpoon.ui")
        local harpoon_mark = require("harpoon.mark")

        vim.keymap.set("n", "<C-a>", function()
            harpoon_mark.add_file()
        end)
        vim.keymap.set("n", "<C-e>", function()
            harpoon_ui.toggle_quick_menu()
        end)

        vim.keymap.set("n", "<C-j>", function()
            harpoon_ui.nav_file(1)
        end)
        vim.keymap.set("n", "<C-k>", function()
            harpoon_ui.nav_file(2)
        end)
        vim.keymap.set("n", "<C-l>", function()
            harpoon_ui.nav_file(3)
        end)
        vim.keymap.set("n", "<C-;>", function()
            harpoon_ui.nav_file(4)
        end)
    end,
}
