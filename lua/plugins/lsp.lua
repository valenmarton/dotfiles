-- return {
--     "neovim/nvim-lspconfig",
--     dependencies = {
--         "VonHeikemen/lsp-zero.nvim",
--         "williamboman/mason.nvim",
--         "williamboman/mason-lspconfig.nvim",
--     },

--     config = function()
--         vim.lsp.set_log_level("debug")
--
--         require("mason").setup()
--         -- Add cmp_nvim_lsp capabilities settings to lspconfig
--         -- This should be executed before you configure any language server
--         local lspconfig_defaults = require('lspconfig').util.default_config
--         lspconfig_defaults.capabilities = vim.tbl_deep_extend(
--             'force',
--             lspconfig_defaults.capabilities,
--             require('cmp_nvim_lsp').default_capabilities()
--         )
--
--         -- This is where you enable features that only work
--         -- if there is a language server active in the file
--         vim.api.nvim_create_autocmd('LspAttach', {
--             desc = 'LSP actions',
--             callback = function(event)
--                 local opts = { buffer = event.buf }
--                 vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
--                 vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
--                 vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
--                 vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
--                 vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
--                 vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
--                 vim.keymap.set("n", "gl", vim.diagnostic.open_float, opts)
--                 vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
--                 vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
--                 vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
--                 vim.keymap.set({ 'n', 'x' }, '<gf>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
--             end,
--         })
--         -- LSP server configs
--         require('lspconfig').ts_ls.setup({})
--         require('lspconfig').eslint.setup({
--
--             cmd = { '/home/martonv/.local/share/nvim/mason/packages/eslint-lsp/node_modules/.bin/vscode-eslint-language-server', '--stdio' }
--         })
--         require('lspconfig').lua_ls.setup({
--             settings = {
--                 Lua = {
--                     runtime = { version = "Lua 5.1" },
--                     diagnostics = {
--                         globals = { "bit", "vim", "it", "describe", "before_each", "after_each" },
--                     },
--                 },
--             },
--         })
--
--         -- autocomplete
--         local cmp = require('cmp')
--         cmp.setup({
--             -- snippet = {
--             --     expand = function(args)
--             --         require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
--             --     end,
--             -- },
--             mapping = cmp.mapping.preset.insert({
--                 ["<Tab>"] = cmp.mapping(function(fallback)
--                     if cmp.visible() then
--                         cmp.select_next_item()
--                     else
--                         fallback()
--                     end
--                 end, { "i" }),
--                 ["<S-Tab>"] = cmp.mapping(function(fallback)
--                     if cmp.visible() then
--                         cmp.select_prev_item()
--                     else
--                         fallback()
--                     end
--                 end, { "i" }),
--                 ['<C-Space>'] = cmp.mapping.complete(),
--                 ['<C-e>'] = cmp.mapping.abort(),
--                 ["<CR>"] = cmp.mapping.confirm({ select = false }),
--             }),
--             sources = cmp.config.sources({
--                 { name = "nvim_lsp" },
--                 { name = "path" },
--                 -- { name = 'vsnip' }, -- For vsnip users.
--                 -- { name = 'luasnip' }, -- For luasnip users.
--                 -- { name = 'ultisnips' }, -- For ultisnips users.
--                 -- { name = 'snippy' }, -- For snippy users.
--             }, {
--                 { name = "buffer" },
--             }),
--         })
--
--         vim.diagnostic.config({
--             -- update_in_insert = true,
--             float = {
--                 focusable = false,
--                 style = "minimal",
--                 border = "rounded",
--                 source = "always",
--                 header = "",
--                 prefix = "",
--             },
--         })
--     end
--
--
-- }
return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
    },

    config = function()
        vim.lsp.set_log_level(0)
        -- keymaps
        local key_opts = {}
        vim.keymap.set("n", "K", vim.lsp.buf.hover, key_opts)
        vim.keymap.set("n", "gcf", vim.lsp.buf.format, key_opts)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, key_opts)
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, key_opts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, key_opts)
        -- vim.keymap.set("n", "gr", vim.lsp.buf.references, key_opts)
        vim.keymap.set("n", "[d", vim.diagnostic.goto_next, key_opts)
        vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, key_opts)
        vim.keymap.set("n", "gl", vim.diagnostic.open_float, key_opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, key_opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, key_opts)
        vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, key_opts)


        local cmp = require("cmp")
        local cmp_lsp = require("cmp_nvim_lsp")
        local capabilities = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities(),
            cmp_lsp.default_capabilities()
        )
        require("mason").setup()
        require("mason-lspconfig").setup({
            automatic_installation = {},
            ensure_installed = {
                "lua_ls",
                "ts_ls",
            },
            handlers = {
                function(server_name) -- default handler, if no other ls handler is specified (optional)
                    require("lspconfig")[server_name].setup {}
                end,
                ["lua_ls"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.lua_ls.setup({
                        capabilities = capabilities,
                        settings = {
                            Lua = {
                                runtime = { version = "LuaJIT" },
                                diagnostics = {
                                    globals = { "bit", "vim", "it", "describe", "before_each", "after_each" },
                                },
                                telemetry = { enable = false },
                                workspace = {
                                    library = vim.api.nvim_get_runtime_file("", true),
                                }
                            },
                        },
                    })
                end,
                ["ts_ls"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.ts_ls.setup({
                        -- cmd = { "/home/martonv/.local/share/nvim/mason/bin/typescript-language-server", "--stdio", "--log-level", "trace" },
                        -- trace = "verbose",
                        -- on_attach = function(client, bufnr)
                        -- 	-- This callback ensures that the LSP is attached to the buffer
                        -- 	-- You can also add any custom logic here (e.g., keybindings)
                        -- 	print("Attached to buffer:", bufnr)
                        -- end,
                        capabilities = capabilities,
                        settings = {
                            javascript = {
                                enable = false,
                                format = {
                                    enable = false,
                                    insertSpaceBeforeFunctionParenthesis = true,
                                    insertSpaceAfterConstructor = true,
                                    insertSpaceAfterFunctionKeywordForAnonymousFunctions = true,
                                    -- insertSpaceAfterOpeningAndBeforeClosingNonemptyParenthesis = true
                                }
                                -- trace = { server = "verbose" }, -- Enable verbose tracing
                            },
                        },
                    })
                end,
                ["eslint"] = function()
                    local lspconfig = require("lspconfig")
                    -- Call has_eslintrc() to evaluate the condition
                    lspconfig.eslint.setup({
                        capabilities = capabilities,
                        settings = {
                            validate = 'off',
                            -- quiet = true,
                            -- silent = true,
                            -- eslint = {
                            --     enable = false,
                            --     autoFixOnSave = true,
                            --     format = {
                            --         enable = false
                            --     }
                            -- }
                        },
                    })
                end,
            },
        })

        -- TODO: swap cmp to blink
        cmp.setup({
            -- snippet = {
            --     expand = function(args)
            --         require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
            --     end,
            -- },
            mapping = cmp.mapping.preset.insert({
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    else
                        fallback()
                    end
                end, { "i" }),
                ["<S-Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    else
                        fallback()
                    end
                end, { "i" }),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<C-e>"] = cmp.mapping.abort(),
                ["<CR>"] = cmp.mapping.confirm({ select = false }),
            }),
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "path" },
                -- { name = 'vsnip' }, -- For vsnip users.
                -- { name = 'luasnip' }, -- For luasnip users.
                -- { name = 'ultisnips' }, -- For ultisnips users.
                -- { name = 'snippy' }, -- For snippy users.
            }, {
                { name = "buffer" },
            }),
        })

        vim.diagnostic.config({
            -- update_in_insert = true,
            float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                source = "always",
                header = "",
                prefix = "",
            },
        })
    end,
}
