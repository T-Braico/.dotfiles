-- note: diagnostics are not exclusive to lsp servers
-- so these can be global keybindings
vim.keymap.set("n", "<leader>of", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)

vim.api.nvim_create_autocmd("LspAttach", {
	desc = "lsp actions",
	callback = function(event)
		local opts = { buffer = event.buf }

		-- these will be buffer-local keybindings
		-- because they only work if you have an active language server

        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, opts)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
        vim.keymap.set("n", "go", vim.lsp.buf.type_definition, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set({ "n", "x" }, "<F3>", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
    end
})

local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()

local server_handlers = {
    -- The first entry (without a key) will be the default handler
    -- and will be called for each installed server that doesn't have
    -- a dedicated handler.
    function(server_name) -- default handler (optional)
        require("lspconfig")[server_name].setup({ capabilites = lsp_capabilites })
    end,
    -- Next, you can provide targeted overrides for specific servers.
    ["lua_ls"] = function()
        local lspconfig = require("lspconfig")
        lspconfig.lua_ls.setup {
            settings = {
                Lua = {
                    diagnostics = {
						globals = { "vim" }
					}
				}
			}
		}
	end,
    ["pylsp"] = function()
        require("lspconfig").pylsp.setup({
            settings = {
                pylsp = {
                    plugins = {
                        pycodestyle = {
                            ignore = {
                                -- "E501",
                                "E302",
                                "E305",
                                "W293",
                                "W391",
                                "E265",
                            },
                        },
                    },
                },
            },
        })
    end,
    ["clangd"] = function()
        require("lspconfig").clangd.setup({
            settings = {
                clangd = {
                    arguments = {  },
                }
            }
        })
    end,
}

require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = {},
	handlers = server_handlers,
})

local cmp = require("cmp")

cmp.setup({
	sources = {
		{ name = "nvim_lsp" },
	},
	mapping = cmp.mapping.preset.insert({
		-- enter key confirms completion item
		["<CR>"] = cmp.mapping.confirm({ select = true }),

		-- ctrl + space triggers completion menu
		-- ["<CR>"] = cmp.mapping.complete(),
	}),
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
})

