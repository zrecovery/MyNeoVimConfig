local config = {}

function config.nvim_bufferline()
  require('bufferline').setup{
    options = {
      modified_icon = '✥',
      buffer_close_icon = '',
      always_show_bufferline = false,
    }
  }
end

function config.nvim_tree()
  require'nvim-tree'.setup {
    view = {
      mappings = {
        custom_only = true,
        list = {
          { key = {"<CR>", "<2-LeftMouse>"}, action = "edit" },
          { key = {"O"},                          action = "edit_no_picker" },
          { key = {"<2-RightMouse>", "o"},    action = "cd" },
          { key = "<C-v>",                        action = "vsplit" },
          { key = "<C-x>",                        action = "split" },
          { key = "<C-t>",                        action = "tabnew" },
          { key = "<",                            action = "prev_sibling" },
          { key = ">",                            action = "next_sibling" },
          { key = "P",                            action = "parent_node" },
          { key = "<BS>",                         action = "close_node" },
          { key = "<Tab>",                        action = "preview" },
          { key = "K",                            action = "first_sibling" },
          { key = "J",                            action = "last_sibling" },
          { key = "I",                            action = "toggle_ignored" },
          { key = "H",                            action = "toggle_dotfiles" },
          { key = "R",                            action = "refresh" },
          { key = "a",                            action = "create" },
          { key = "d",                            action = "remove" },
          { key = "D",                            action = "trash" },
          { key = "r",                            action = "rename" },
          { key = "<C-r>",                        action = "full_rename" },
          { key = "x",                            action = "cut" },
          { key = "c",                            action = "copy" },
          { key = "p",                            action = "paste" },
          { key = "y",                            action = "copy_name" },
          { key = "Y",                            action = "copy_path" },
          { key = "gy",                           action = "copy_absolute_path" },
          { key = "[c",                           action = "prev_git_item" },
          { key = "]c",                           action = "next_git_item" },
          { key = "-",                            action = "dir_up" },
          { key = "s",                            action = "system_open" },
          { key = "q",                            action = "close" },
          { key = "g?",                           action = "toggle_help" },
        }
      },
    }
  }
end

function config.gitsigns()
  if not packer_plugins['plenary.nvim'].loaded then
    vim.cmd [[packadd plenary.nvim]]
  end
  require('gitsigns').setup {
    signs = {
      add = {hl = 'GitGutterAdd', text = '▋'},
      change = {hl = 'GitGutterChange',text= '▋'},
      delete = {hl= 'GitGutterDelete', text = '▋'},
      topdelete = {hl ='GitGutterDeleteChange',text = '▔'},
      changedelete = {hl = 'GitGutterChange', text = '▎'},
    },
    keymaps = {
       -- Default keymap options
       noremap = true,
       buffer = true,

       ['n ]g'] = { expr = true, "&diff ? ']g' : '<cmd>lua require\"gitsigns\".next_hunk()<CR>'"},
       ['n [g'] = { expr = true, "&diff ? '[g' : '<cmd>lua require\"gitsigns\".prev_hunk()<CR>'"},

       ['n <leader>hs'] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
       ['n <leader>hu'] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
       ['n <leader>hr'] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
       ['n <leader>hp'] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
       ['n <leader>hb'] = '<cmd>lua require"gitsigns".blame_line()<CR>',

       -- Text objects
       ['o ih'] = ':<C-U>lua require"gitsigns".text_object()<CR>',
       ['x ih'] = ':<C-U>lua require"gitsigns".text_object()<CR>'
     },
  }
end

return config
