return {
    "Saghen/blink.cmp",
    -- optional: provides snippets for the snippet source
    disabled = true,
    dependencies = { 'rafamadriz/friendly-snippets', 'neovim/nvim-lspconfig' },

    -- example using `opts` for defining servers
    opts = {
        servers = {
            lua_ls = {}
        }
    },
    config = function(_, opts)
        local lspconfig = require('lspconfig')
        for server, config in pairs(opts.servers) do
            -- passing config.capabilities to blink.cmp merges with the capabilities in your
            -- `opts[server].capabilities, if you've defined it
            config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
            lspconfig[server].setup(config)
        end
    end
}
