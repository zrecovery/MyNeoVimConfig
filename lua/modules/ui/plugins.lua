local ui = {}
local conf = require('modules.ui.config')

ui['Iron-E/nvim-highlite'] = {
  config = function ()
    vim.api.nvim_command 'colorscheme highlite'
  end
}

ui['nvim-neo-tree/neo-tree.nvim'] = {
  config = conf.nvim_neo_tree,
  requires = {
    "nvim-lua/plenary.nvim",
    "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim"
    }
}

ui['NTBBloodbath/galaxyline.nvim'] = {
  config = function()
    require("galaxyline.themes.eviline")
  end,
  requires = 'kyazdani42/nvim-web-devicons'
}

ui['akinsho/nvim-bufferline.lua'] = {
  config = conf.nvim_bufferline,
  requires = 'kyazdani42/nvim-web-devicons'
}

ui['lewis6991/gitsigns.nvim'] = {
  event = {'BufRead','BufNewFile'},
  config = conf.gitsigns,
  requires = {'nvim-lua/plenary.nvim',opt=true}
}

return ui
