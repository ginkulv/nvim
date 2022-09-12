vim.api.nvim_create_autocmd('BufWritePost', {
    group = vim.api.nvim_create_augroup('PACKER', { clear = true }),
    pattern = 'plugins.lua',
    command = 'source <afile> | PackerCompile',
})

return require'packer'.startup(function(use)

    use 'wbthomason/packer.nvim'
    use 'vim-airline/vim-airline'
    use 'vim-airline/vim-airline-themes'
    use {'neoclide/coc.nvim', branch = 'release'}
    use 'arcticicestudio/nord-vim'
    use 'JuliaEditorSupport/julia-vim'
    use 'pacha/vem-tabline'
    use 'ryanoasis/vim-devicons'
    use 'pappasam/coc-jedi'
    use 'lervag/vimtex'
    use 'vimwiki/vimwiki'
    use 'nvim-treesitter/nvim-treesitter'
    use 'nvim-treesitter/nvim-treesitter-context'
    use 'nvim-treesitter/playground'
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = { 'nvim-lua/plenary.nvim' }
    }
end)

--[[" Plugins settings
let g:deoplete#enable_at_startup = 1

let g:vem_tabline_multiwindow_mode = 1

let g:python_highlight_space_errors = 0
let g:python_highlight_all = 1

" let g:vimtex_compiler_method = 'latexrun'
let g:vimtex_view_general_viewer = 'SumatraPDF'
let g:vimtex_view_general_options
\ = '-reuse-instance -forward-search @tex @line @pdf'

autocmd FileType python nnoremap <C-s> :!python.exe<Space>%<CR>
autocmd FileType julia nnoremap <C-s> :!julia.exe<Space>%<CR>
autocmd FileType vimwiki nnoremap <leader>t :VimwikiToggleListItem<CR>

--]]
