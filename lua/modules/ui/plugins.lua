local ui = {}
local conf = require('modules.ui.config')

ui['glepnir/zephyr-nvim'] = {
  config = [[vim.cmd('colorscheme zephyr')]]
}

ui['glepnir/dashboard-nvim'] = {
  config = conf.dashboard
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

ui['kyazdani42/nvim-tree.lua'] = {
   cmd = {'NvimTreeToggle','NvimTreeOpen'},
   config = conf.nvim_tree,
  requires = 'kyazdani42/nvim-web-devicons'
}

ui['lewis6991/gitsigns.nvim'] = {
  event = {'BufRead','BufNewFile'},
  config = conf.gitsigns,
  requires = {'nvim-lua/plenary.nvim',opt=true}
}

return ui
