-- mason.lua
return {
    -- Mason base
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup({
                ui = { border = "rounded" },
            })
        end,
    },

    -- LSP Installer
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "pyright",
                    "clangd",
                    "cssls",
                    "bashls",
                    "jsonls",
                    "html",
                    "ts_ls",
                    "jdtls",
                },
                automatic_installation = true,
            })
        end,
    },

    -- Debug adapters
    {
        "jay-babu/mason-nvim-dap.nvim",
        config = function()
            require("mason-nvim-dap").setup({
                ensure_installed = {
                    "java-debug-adapter",
                    "java-test",
                    "python",
                    "codelldb",
                    "js-debug-adapter",
                },
                automatic_installation = true,
            })
        end,
    },

    -- Formatters & Linters
    {
        "jay-babu/mason-null-ls.nvim",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = { "nvimtools/none-ls.nvim" },
        config = function()
            local mason_null_ls = require("mason-null-ls")
            mason_null_ls.setup({
                ensure_installed = {
                    "black",       -- Python
                    "clang_format",-- C/C++
                    "prettier",    -- JS/HTML/CSS
                    "stylua",      -- Lua
                },
                automatic_installation = true,
            })

            local null_ls = require("null-ls")
            null_ls.setup({
                sources = {
                    null_ls.builtins.formatting.black,
                    null_ls.builtins.formatting.clang_format,
                    null_ls.builtins.formatting.prettier,
                    null_ls.builtins.formatting.stylua,
                },
            })
        end,
    },

    -- Java utilities
    {
        "mfussenegger/nvim-jdtls",
        dependencies = {
            "mfussenegger/nvim-dap",
            "ray-x/lsp_signature.nvim",
        },
    },

    -- Signature help
    {
        "ray-x/lsp_signature.nvim",
        config = function()
            require("lsp_signature").setup({
                bind = true,
                hint_enable = true,
                handler_opts = { border = "rounded" },
            })
        end,
    },

    -- Core LSP config
    {
        "neovim/nvim-lspconfig",
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            local icons = require("configs.icons")

            -- Modular LSP setup
            local servers = {
                "lua_ls",
                "pyright",
                "clangd",
                "cssls",
                "bashls",
                "jsonls",
                "html",
                "tsserver", -- corrected from ts_ls
                "jdtls"
            }

            for _, name in ipairs(servers) do
                local ok, server = pcall(require, "configs.lsp." .. name)
                if ok and server.setup then
                    server.setup(capabilities)
                end
            end

            -- Diagnostics styling
            local signs = {
                { name = "DiagnosticSignError", text = icons.diagnostics.Error },
                { name = "DiagnosticSignWarn",  text = icons.diagnostics.Warning },
                { name = "DiagnosticSignHint",  text = icons.diagnostics.Hint },
                { name = "DiagnosticSignInfo",  text = icons.diagnostics.Information },
            }

            for _, sign in ipairs(signs) do
                vim.fn.sign_define(sign.name, {
                    text = sign.text,
                    texthl = sign.name,
                    numhl = "",
                })
            end

            vim.diagnostic.config({
                signs = { active = signs },
                virtual_text = false,
                update_in_insert = false,
                underline = true,
                severity_sort = true,
                float = {
                    focusable = true,
                    style = "minimal",
                    border = "rounded",
                    source = "always",
                },
            })

            -- LSP keymaps
            vim.keymap.set("n", "<leader>ch", vim.lsp.buf.hover, { desc = "[C]ode [H]over" })
            vim.keymap.set("n", "<leader>cd", vim.lsp.buf.definition, { desc = "[C]ode [D]efinition" })
            vim.keymap.set("n", "<leader>cr", require("telescope.builtin").lsp_references, { desc = "[C]ode [R]eferences" })
            vim.keymap.set("n", "<leader>ci", require("telescope.builtin").lsp_implementations, { desc = "[C]ode [I]mplementations" })
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "[C]ode [A]ction" })
            vim.keymap.set("n", "<leader>cR", vim.lsp.buf.rename, { desc = "[C]ode [R]ename" })
            vim.keymap.set("n", "<leader>cD", vim.lsp.buf.declaration, { desc = "[C]ode [D]eclaration" })
        end,
    },


    -- Java meta package
    {
        "nvim-java/nvim-java",
    },
}
