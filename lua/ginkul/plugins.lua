vim.api.nvim_create_autocmd('BufWritePost', {
    group = vim.api.nvim_create_augroup('PACKER', { clear = true }),
    pattern = 'plugins.lua',
    command = 'source <afile> | PackerCompile',
})

return require('packer').startup({ function(use)

    -- Core
    use 'wbthomason/packer.nvim'
    use 'williamboman/nvim-lsp-installer'
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'dcampos/nvim-snippy'
    use 'ray-x/lsp_signature.nvim'
    -- Colorschemes
    use 'arcticicestudio/nord-vim'
    use 'davidosomething/vim-colors-meh'
    use 'owickstrom/vim-colors-paramount'
    -- Language specific
    use 'JuliaEditorSupport/julia-vim'
    use 'elixir-editors/vim-elixir'
    use 'lervag/vimtex'
    use {
        "iamcco/markdown-preview.nvim",
        run = "cd app && npm install",
        setup = function() vim.g.mkdp_filetypes = { "markdown" } end,
        ft = { "markdown" },
    }
    -- Appearance
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    use 'pacha/vem-tabline'
    use 'ryanoasis/vim-devicons'
    -- Utils
    use 'vimwiki/vimwiki'
    use 'nvim-treesitter/nvim-treesitter'
    use 'nvim-treesitter/nvim-treesitter-context'
    use 'nvim-treesitter/playground'
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = { 'nvim-lua/plenary.nvim' }
    }
    use 'godlygeek/tabular'
end,
config = {
    display = {
        open_fn = function()
            return require('packer.util').float( { border = 'single' })
        end,
    },
}})
