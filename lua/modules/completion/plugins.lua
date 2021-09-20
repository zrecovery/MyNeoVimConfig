local completion = {}
local conf = require('modules.completion.config')

completion['neovim/nvim-lspconfig'] = {
  config = conf.lspcfg,
}

completion['glepnir/lspsaga.nvim'] = {
  cmd = 'Lspsaga',
  config = conf.saga,
}

completion["hrsh7th/nvim-cmp"] = {
  requires = {
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-nvim-lua",
    "saadparwaiz1/cmp_luasnip"
  },
  config = conf.cmp
}

completion["tzachar/cmp-tabnine"] = {
  run = "./install.sh",
  requires = "hrsh7th/nvim-cmp"
}

completion["onsails/lspkind-nvim"] = {
  requires = "hrsh7th/nvim-cmp",
  config = conf.kind
}

completion["L3MON4D3/LuaSnip"] = {
  config = conf.luasnip
}

completion["rafamadriz/friendly-snippets"] = {}

completion['nvim-telescope/telescope.nvim'] = {
  cmd = 'Telescope',
  config = conf.telescope,
  requires = {
    {'nvim-lua/popup.nvim', opt = true},
    {'nvim-lua/plenary.nvim',opt = true},
    {'nvim-telescope/telescope-fzy-native.nvim',opt = true},
  }
}
return completion
