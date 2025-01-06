-- Create the user command
-- vim.env.PATH = vim.env.PATH .. ";/home/youruser/.local/share/nvim/mason/bin"
vim.env.PATH = '/home/martonv/.local/share/nvim/mason/bin:' .. vim.env.PATH


vim.api.nvim_create_user_command("SetCwdToCurrentFile", function()
    local current_file = vim.fn.expand("%:p")
    local current_directory = vim.fn.fnamemodify(current_file, ":h")
    local clean_path = string.gsub(current_directory, "^oil://", "")
    -- print("root dir: " .. clean_path)
    vim.cmd("lcd " .. vim.fn.fnameescape(clean_path))
    -- vim.cmd("lcd " .. vim.fn.fnameescape(current_directory))

    -- for NETRW
    -- local current_file = vim.fn.expand("%:p")
    -- local current_directory = vim.fn.fnamemodify(current_file, ":h")
    -- print("root dir: " .. current_directory)
    -- vim.cmd("lcd " .. vim.fn.fnameescape(current_directory))
end, {})

-- Create the autocmd group
vim.cmd([[
augroup cdpwd
    autocmd!
    autocmd VimEnter * SetCwdToCurrentFile
augroup END
]])

-- Autoformat & run eslint on js/ts files
vim.api.nvim_create_autocmd("BufWritePre", {
    callback = function()
        local mode = vim.api.nvim_get_mode().mode
        local filetype = vim.bo.filetype
        local modified = vim.bo.modified
        if filetype == 'oil' then 
            return
        end
        if modified == true and mode == 'n' then
            vim.lsp.buf.format()
        end
        if filetype == 'javascript' or filetype == 'typescript' then
            vim.cmd('EslintFixAll')
        end
    end
})


-- loading plugins
require("config.lazy")
-- loading basic settings & keymaps
require("config.set")
require("config.remap")
