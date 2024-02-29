vim.g.mapleader = " "

vim.keymap.set("i", "{<Enter>", "{<Enter><Backspace>}<C-c>kA<C-c>o")
vim.keymap.set("i", "(<Enter>", "(<Enter><Backspace>)<C-c>kA<C-c>o")

vim.keymap.set("i", "gp", "<C-c>")

vim.keymap.set("n", "<leader>o", "o<C-c>")
vim.keymap.set("n", "<leader>O", "O<C-c>")

vim.keymap.set("n", "<leader>A", "A<C-C>")
vim.keymap.set("n", "<leader>I", "I<C-C>")

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>w", vim.cmd.w)
vim.keymap.set("n", "<leader>q", vim.cmd.q)
vim.keymap.set("n", "<leader>fq", "<cmd>q!<cr>")

vim.keymap.set("n", "<C-T>", vim.cmd.tabnew)
vim.keymap.set("n", "<C-n>", vim.cmd.tabnext)
vim.keymap.set("n", "<C-N>", vim.cmd.tabprevious)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

local run_cmds = {
    ["py"] = "python",
    ["go"] = "go run",
    ["lua"] = "lua",
}

-- local function sleep(n)
--     os.execute("sleep " .. tonumber(n))
-- end

vim.keymap.set("n", "<leader>ru", function()
    local filename = vim.fn.expand("%:p")

    local extension = filename:match("^.+(%..+)$")
    if extension then
        extension = extension:sub(2)
    else
        return
    end
    local cmd = "!" .. run_cmds[extension] .. " " .. filename
    vim.cmd(cmd)
end
)
