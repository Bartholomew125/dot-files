return { 
    'nvim-mini/mini.files', 
    version = '*',
    config = function()
        require('mini.files').setup({
            mappings = {
                close       = '<C-n>',
                go_in       = '',
                go_in_plus  = '<CR>',
                go_out      = '<BS>',
                go_out_plus = '',
                reset       = '<S-BS>'
            },
        })
    end,
}

