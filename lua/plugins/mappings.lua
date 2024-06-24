return {
  {
    "AstroNvim/astrocore",
    --- @type AstroCoreOpts
    opts = {
      mappings = {
        n = {
          ["<A-Down>"] = { ":m .+1<CR>==" },
          ["<A-Up>"] = { ":m .-2<CR>==" },
          ["<S-Tab>"] = { ":bprev<CR>", noremap = true },
          ["<Tab>"] = { ":bnext<CR>", noremap = true },
        },
        v = {
          ["<A-Down>"] = { ":m '>+1<CR>gv=gv" },
          ["<A-Up>"] = { ":m '<-2<CR>gv=gv" },
        },
      },
    },
  },
}

-- vim.api.nvim_set_keymap('n', '<S-Tab>', ':bprev<CR>', { noremap = true })
-- vim.api.nvim_set_keymap('n', '<Tab>', ':bnext<CR>', { noremap = true })
