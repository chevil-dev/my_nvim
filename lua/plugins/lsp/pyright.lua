-- pyright
return {
    setup = function(capabilities)
        vim.lsp.config.pyright.setup({
            capabilities = capabilities,
        })
    end,
}
