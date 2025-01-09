-- exchanged with oil.nvim
-- vim.keymap.set("n", "<bs><bs>", "<cmd>Ex<cr>", { desc = "Open parent directory" })
vim.keymap.set("n", "<bs><bs>", "<cmd>Oil<cr>", { desc = "Open parent directory" })

-- move lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- better half page scroll
-- vim.keymap.set("n", "<C-d>", "<C-d>zz")
-- vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- clipboard
vim.keymap.set("n", "x", '"_x')
vim.keymap.set({ "n", "v" }, "<leader>p", [["+p]])
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- better j&k when using linewraps
vim.keymap.set({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "_", "g_")
vim.keymap.set("n", "^", "g^")
vim.keymap.set("n", "$", "g$")
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")

-- quickfixlist
-- qflist close
vim.keymap.set("n", "<leader>q", function()
    local qf_exists = false
    for _, win in pairs(vim.fn.getwininfo()) do
        if win["quickfix"] == 1 then
            qf_exists = true
        end
    end
    if qf_exists == true then
        vim.cmd "cclose"
        return
    end
    if not vim.tbl_isempty(vim.fn.getqflist()) then
        vim.cmd "copen"
    end
end)
vim.keymap.set("n", "[q", ":cnext<cr>")
vim.keymap.set("n", "]q", ":cprev<cr>")

vim.keymap.set("n", "<C-s>", "5j")
vim.keymap.set("n", "<C-f>", "5k")
