-- tsserver
return {
    setup = function(capabilities)
        vim.lsp.config.tsserver.setup({
            capabilities = capabilities,
        })
    end,
}
