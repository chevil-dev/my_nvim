-- lua_ls
return {
    setup = function(capabilities)
        vim.lsp.config.lua_ls.setup({
            capabilities = capabilities,
            settings = {
                Lua = {
                    diagnostics = { globals = { "vim" } },
                    workspace = { checkThirdParty = false },
                },
            },
        })
    end,
}
