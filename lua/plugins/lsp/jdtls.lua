-- jdtls
return {
    setup = function(capabilities)
        -- Java LSP setup (Arch compatible)
        require("lspconfig").jdtls.setup({
            cmd = {
                vim.fn.expand("~/.local/share/nvim/mason/packages/jdtls/bin/jdtls"),
                "-configuration",
                vim.fn.expand("~/.cache/jdtls/config"),
                "-data",
                vim.fn.expand("~/.cache/jdtls/workspace"),
            },
            capabilities = capabilities,
        })
    end,
}
