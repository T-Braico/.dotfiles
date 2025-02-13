require("tokyonight").setup({ style = "night" })
vim.cmd.colorscheme('tokyonight')

local function transparent()
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

vim.api.nvim_create_user_command("Transparent", transparent, {
    nargs = 0,
    desc = "Make the background transparent for all Neovim windows",
})
