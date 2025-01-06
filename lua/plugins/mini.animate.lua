return {
    'echasnovski/mini.animate',
    version = '*',
    enabled = false,
    config = function()
        require('mini.animate').setup({
            cursor = { enable = false },
        })
    end
}
