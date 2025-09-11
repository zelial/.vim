return {
    'echasnovski/mini.surround',
    config = function()
        require('mini.surround').setup({
            mappings = {
                add = '<leader>sa', -- Add surrounding in Normal and Visual modes
                delete = '', -- Delete surrounding
                find = '', -- Find surrounding (to the right)
                find_left = '', -- Find surrounding (to the left)
                highlight = '', -- Highlight surrounding
                replace = '', -- Replace surrounding
                update_n_lines = '', -- Update `n_lines`
            },
        })
    end
}

