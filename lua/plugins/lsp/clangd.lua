-- clangd
return {
    setup = function(capabilities)
        vim.lsp.config.clangd.setup({
            capabilities = capabilities,
        })
    end,
}

