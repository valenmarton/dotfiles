return {
    "nvim-lualine/lualine.nvim",
    enabled = false,
    opts = {
    },
    config = function()
        local clients_lsp = function()
            local bufnr = vim.api.nvim_get_current_buf()

            local clients = vim.lsp.get_clients({ buffer = bufnr })
            if next(clients) == nil then
                return ''
            end

            local c = {}
            for _, client in pairs(clients) do
                table.insert(c, client.name)
            end
            return '' .. table.concat(c, '|')
        end

        require("lualine").setup({
            -- options = { section_separators = { left = '', right = '' }, component_separators = '' },
            options = { section_separators = { left = '', right = '' }, component_separators = '' },

            sections = {
                lualine_a = { 'mode' },
                lualine_b = { 'branch', 'diff' },
                lualine_c = { { 'filename', path = 1 }, 'diagnostics' },
                lualine_x = { 'encoding', 'fileformat', clients_lsp, 'filetype' },
            },
        })
    end
}
