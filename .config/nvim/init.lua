-- Make sure to setup `mapleader` and `maplocalleader` before 
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

vim.o.history = 300
vim.o.wildmenu = true
vim.o.wildmode = "longest:full,full"
vim.o.wildignorecase = true
vim.o.showcmd = true
vim.o.hidden = true
vim.o.ttyfast = true
vim.o.backspace = "indent,eol,start"
vim.o.encoding = "utf-8"
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.expandtab = true
vim.o.number = true
vim.o.ruler = true
vim.o.incsearch = true
vim.o.hlsearch = true
vim.o.wrapscan = false
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.backup = false
vim.o.swapfile = false
vim.o.list = true
vim.o.scrolloff = 3
vim.opt.listchars = {tab='»-', trail='-', eol='↲', extends='»', precedes='«', nbsp='%'}
vim.opt.whichwrap = "b,s,h,l,<,>,[,]"
vim.cmd[[colorscheme desert]]

-- remap
vim.keymap.set("n", "tn", ":tabn<CR>", { remap = true, silent = true })
vim.keymap.set("n", "tp", ":tabp<CR>", { remap = true, silent = true })
vim.keymap.set("", "x", '"_x')
vim.keymap.set({"n", "v"}, "j", "gj", { noremap = true, silent = true })
vim.keymap.set({"n", "v"}, "k", "gk", { noremap = true, silent = true })
-- vim.keymap.set('n', '<leader>cc', '<cmd>ClaudeCode<CR>', { desc = 'Toggle Claude Code' })

-- ale
vim.g.ale_enable = 1
vim.g.ale_lint_on_save = 1
vim.g.ale_lint_on_text_changed = 'normal'
vim.g.ale_linters_explicit = 1
vim.g.ale_linters = {
  javascript = { 'eslint' },
  typescript = { 'eslint' },
}
vim.g.ale_warn_about_trailing_whitespace = 0  -- よくある警告を無効化
vim.g.ale_set_signs = 1  -- エラー表示は維持
vim.g.ale_sign_warning = ''  -- 警告マークを非表示
vim.g.ale_echo_warning = 0   -- 警告のメッセージをエコーしない
vim.g.ale_virtualtext_cursor = 0  -- カーソル位置の警告を非表示（オプション）

-- 前回のカーソル位置に復帰する
vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local line_count = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= line_count then
      pcall(vim.api.nvim_win_set_cursor, 0, {mark[1], mark[2]})
    end
  end,
})

-- Setup lazy.nvim
require("lazy").setup({
  {'github/copilot.vim'},
  {'travisjeffery/vim-auto-mkdir'},
  {'tomtom/tcomment_vim'},
  {'rking/ag.vim'}, 
  {'vim-scripts/Align'},
  {'leafOfTree/vim-vue-plugin'},
  {'dense-analysis/ale'},
  {
    'kana/vim-textobj-user',
    dependencies = {
      "kana/vim-textobj-entire",
      "kana/vim-textobj-line",
      "kana/vim-textobj-syntax",
    }
  },
  {'tpope/vim-surround'},
  {'akiyan/vim-textobj-xml-attribute', dependencies = {'kana/vim-textobj-user'}},
  {
    "coder/claudecode.nvim",
    lazy = false,
    dependencies = { "folke/snacks.nvim" },
    config = true,
    keys = {
      { "<leader>a", nil, desc = "AI/Claude Code" },
      { "<leader>ac", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude" },
      { "<leader>af", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude" },
      { "<leader>ar", "<cmd>ClaudeCode --resume<cr>", desc = "Resume Claude" },
      { "<leader>aC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude" },
      { "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>", desc = "Add current buffer" },
      { "<leader>as", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send to Claude" },
      {
        "<leader>as",
        "<cmd>ClaudeCodeTreeAdd<cr>",
        desc = "Add file",
        ft = { "NvimTree", "neo-tree", "oil" },
      },
      -- Diff management
      { "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
      { "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Deny diff" },
    },
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup({
      })
    end
  },
  -- spec = {
  --   -- プラグイン定義ファイルのインポート
  --   { import = "plugins" },
  -- },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "desert" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})
