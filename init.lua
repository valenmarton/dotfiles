-- Create the user command
vim.api.nvim_create_user_command("SetCwdToCurrentFile", function()
    local current_file = vim.fn.expand("%:p")
    local current_directory = vim.fn.fnamemodify(current_file, ":h")
    print("root dir: " .. current_directory)
    vim.cmd("lcd " .. vim.fn.fnameescape(current_directory))
end, {})

-- Create the autocmd group
vim.cmd([[
augroup cdpwd
    autocmd!
    autocmd VimEnter * SetCwdToCurrentFile
augroup END
]])

-- loading plugins
require("config.lazy")
-- loading basic settings & keymaps
require("config.set")
require("config.remap")
