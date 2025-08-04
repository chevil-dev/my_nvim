return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = {
		-- ts-autotag utilizes treesitter to understand the code structure to automatically close tsx tags
		"windwp/nvim-ts-autotag",
	},
	build = ":TSUpdate",
	config = function()
		local ts_config = require("nvim-treesitter.configs")
		ts_config.setup({
			ensure_installed = {
				"c",
				"cpp",
				"lua",
				"vim",
				"vimdoc",
				"query",
				"markdown",
				"markdown_inline",
				"javascript",
				"python",
				"java",
				"typescript",
				"html",
				"css",
				"json",
				"tsx",
				"gitignore",
			},
			highlight = { enable = true },
			indent = { enable = true },
			autotag = { enable = true },
		})
	end,
}
