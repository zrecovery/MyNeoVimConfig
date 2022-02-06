local completion = {}
local conf = require('modules.completion.config')

completion['neovim/nvim-lspconfig'] = {
  config = conf.lspcfg,
}

completion['tami5/lspsaga.nvim'] = {
  cmd = 'Lspsaga',
  config = conf.saga,
}

completion["hrsh7th/nvim-cmp"] = {
  events = 'InsertEnter',
  requires = {
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-cmdline",
    "saadparwaiz1/cmp_luasnip"
  },
  config = conf.cmp
}

completion["onsails/lspkind-nvim"] = {
  requires = "hrsh7th/nvim-cmp",
  config = conf.kind
}

completion["L3MON4D3/LuaSnip"] = {
  events = "InsertCharPre",
  config = conf.luasnip
}

completion["rafamadriz/friendly-snippets"] = {}


completion['mattn/vim-sonictemplate'] = {
  cmd = 'Template',
  ft = {'go','typescript','lua','javascript','vim','markdown'},
  config = conf.vim_sonictemplate,
}

completion['nvim-telescope/telescope.nvim'] = {
  cmd = 'Telescope',
  config = conf.telescope,
  requires = {
    {'nvim-lua/popup.nvim'},
    {'nvim-lua/plenary.nvim'},
    {'nvim-telescope/telescope-fzy-native.nvim'},
  }
}
return completion
