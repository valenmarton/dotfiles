return {
    'stevearc/conform.nvim',
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    enabled = true,
    config = function()
        require("conform").setup({
            -- this will format on save by the default LSP's formatter, if no formatters are specified below
            format_on_save = {
                -- These options will be passed to conform.format()
                timeout_ms = 500,
                -- fallback to LSP format if no formatters_by_ft is specified
                lsp_format = "fallback",
            },
            formatters_by_ft = {
                -- lua = { "stylua" },
                -- Conform will run multiple formatters sequentially
                -- python = { "isort", "black" },
                -- You can customize some of the format options for the filetype (:help conform.format)
                -- rust = { "rustfmt", lsp_format = "fallback" },
                -- Conform will run the first available formatter
                javascript = { "prettier", "prettierd", stop_after_first = true },
                typescript = { "prettier" }
            },
        })
    end
}
