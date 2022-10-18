require('telescope').setup {
    defaults = {
        file_ignore_patterns = { "target", "deps", "_build", ".git" }
    }
}

require('lualine').setup()

require('nvim-lsp-installer').setup{}

require('lsp_signature').setup{
    hint_prefix = "↳ "
}

local cmp = require('cmp')
cmp.setup {

    snippet = {
        expand = function(args)
            require('snippy').expand_snippet(args.body)
        end,
    },

    formatting = {
        format = function(entry, vim_item)
            vim_item.menu = ({
                ultisnips = "[UltiSnips]",
                nvim_lsp = "[LSP]",
                buffer = "[Buffer]",
                nvim_lua = "[Lua]",
                cmp_tabnine = "[TabNine]",
            })[entry.source.name]
            return vim_item
        end
    },

    sources = {
        { name = 'nvim_lsp' },
        { name = 'buffer' }
    },

    mapping = cmp.mapping.preset.insert({
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-p>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),
        ['<C-n>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
    })
}

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

require('lspconfig').sumneko_lua.setup{
    capabilities = capabilities,
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
}

require('lspconfig').julials.setup{
    filetypes = {"julia"},
    capabilities = capabilities
}

require('lspconfig').rust_analyzer.setup{
    filetypes = {"rust"},
    capabilities = capabilities
}

require('lspconfig').pyright.setup {
    filetypes = {"python"},
    capabilities = capabilities
}
