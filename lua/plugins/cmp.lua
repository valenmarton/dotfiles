return {
    "hrsh7th/nvim-cmp",
    -- load cmp on InsertEnter
    event = "InsertEnter",
    -- these dependencies will only be loaded when cmp loads
    -- dependencies are always lazy-loaded unless specified otherwise
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
    },
    config = function()
        -- ...
    end,
    -- {
    --     'saghen/blink.cmp',
    --     enabled = false,
    --     lazy = false,
    --     -- use a release tag to download pre-built binaries
    --     version = 'v0.*',
    --     -- OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
    --     -- build = 'cargo build --release',
    --
    --     opts = {
    --         keymap = {
    --             show = '<C-space>',
    --             hide = '<C-e>',
    --             accept = '<Enter>',
    --             select_prev = { '<S-Tab>', '<C-p>' },
    --             select_next = { '<Tab>', '<C-n>' },
    --
    --             show_documentation = {},
    --             hide_documentation = {},
    --             scroll_documentation_up = '<C-b>',
    --             scroll_documentation_down = '<C-f>',
    --         },
    --         highlight = {
    --             -- sets the fallback highlight groups to nvim-cmp's highlight groups
    --             -- useful for when your theme doesn't support blink.cmp
    --             -- will be removed in a future release, assuming themes add support
    --             use_nvim_cmp_as_default = true,
    --         },
    --         -- set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
    --         -- adjusts spacing to ensure icons are aligned
    --         nerd_font_variant = 'normal',
    --
    --         -- experimental auto-brackets support
    --         -- accept = { auto_brackets = { enabled = true } }
    --
    --         -- experimental signature help support
    --         -- trigger = { signature_help = { enabled = true } }
    --     }
    -- }
}
