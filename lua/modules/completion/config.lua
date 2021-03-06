local config = {}

function config.lspcfg()
  -- Add additional capabilities supported by nvim-cmp
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.documentationFormat = { 'markdown', 'plaintext' }
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  capabilities.textDocument.completion.completionItem.preselectSupport = true
  capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
  capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
  capabilities.textDocument.completion.completionItem.deprecatedSupport = true
  capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
  capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
  capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {
      'documentation',
      'detail',
      'additionalTextEdits',
    },
  }

    -- Enable some language servers with the additional completion capabilities offered by nvim-cmp
    local servers = { 'sourcekit', 'sumneko_lua', 'svelte','tsserver', 'cssls'}
    for _, lsp in ipairs(servers) do
      require('lspconfig')[lsp].setup {
        capabilities = capabilities,
      }
      if lsp == 'sumneko_lua' then
        require('lspconfig')[lsp].setup{
           settings = {
                       Lua = {
                              runtime = {
                version = 'LuaJIT'
              },
                diagnostics = {
                  globals = { 'vim', 'packer_plugins'}
                }
              }
            }
         }
      end
    end
end

function config.kind()
  require("lspkind").init(
    {
      -- enables text annotations
      --
      -- default: true
      mode = true,
      -- default symbol map
      -- can be either 'default' (requires nerd-fonts font) or
      -- 'codicons' for codicon preset (requires vscode-codicons font)
      --
      -- default: 'default'
      preset = "codicons",
      -- override preset symbols
      --
      -- default: {}
      symbol_map = {
        Text = "???",
        Method = "???",
        Function = "???",
        Constructor = "???",
        Field = "???",
        Variable = "???",
        Class = "???",
        Interface = "???",
        Module = "???",
        Property = "???",
        Unit = "???",
        Value = "???",
        Enum = "???",
        Keyword = "???",
        Snippet = "???",
        Color = "???",
        File = "???",
        Reference = "???",
        Folder = "???",
        EnumMember = "???",
        Constant = "???",
        Struct = "???",
        Event = "???",
        Operator = "???",
        TypeParameter = ""
      }
    }
  )
end

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'


function config.cmp()
  local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
  end
  
  local luasnip = require("luasnip")
  local cmp = require("cmp")
  
  cmp.setup {
    snippet = {
      expand = function(args)
        require "luasnip".lsp_expand(args.body)
      end
    },
    formatting = {
      format = function(entry, vim_item)
        -- fancy icons and a name of kind
        vim_item.kind = require("lspkind").presets.default[vim_item.kind] .. " " .. vim_item.kind
        -- set a name for each source
        vim_item.menu =
          ({
          nvim_lsp = "[LSP]",
          nvim_lua = "[Lua]",
          path = "[Path]",
          luasnip = "[LuaSnip]"
        })[entry.source.name]
        return vim_item
      end
    },
    mapping = {
      ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),

    ['<CR>'] = cmp.mapping.confirm({ select = true }),
         },
    sources = {
      {name = "buffer"},
      {name = "nvim_lsp"},
      {name = "path"},
      {name = "nvim_lua"},
      {name = "luasnip"}
    },
    completion = {completeopt = "menu,menuone,noinsert"}
  }
  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })
end

function config.luasnip()
  require("luasnip/loaders/from_vscode").load(
    {paths = {"~/.local/share/nvim/site/pack/packer/start/friendly-snippets"}}
  )
end

function config.saga()
  local saga = require 'lspsaga'
saga.init_lsp_saga {
  error_sign = "???",
  warn_sign = "???",
  hint_sign = "???",
  infor_sign = "???",
  max_preview_lines = 30,
  finder_action_keys = {
  open = 'o', vsplit = 's',split = 'i',quit = {'q', "<esc>"},scroll_down = '<C-f>', scroll_up = '<C-b>' -- quit can be a table
  },
  code_action_keys = {
    quit = {'q', "<esc>"},exec = '<CR>'
  },
  rename_action_keys = {
    quit = {'<C-c>', "<esc>"},exec = '<CR>'  -- quit can be a table
  },
}
end

function config.telescope()
--  if not packer_plugins['plenary.nvim'].loaded then
  --     vim.cmd [[packadd plenary.nvim]]
  --     vim.cmd [[packadd popup.nvim]]
  --     vim.cmd [[packadd telescope-fzy-native.nvim]]
  -- end
  require('telescope').setup {
    defaults = {
      prompt_prefix = '???? ',
      selection_caret = "??? ",
      sorting_strategy = 'ascending',
      file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
      grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
      qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,
    },
    layout_config = {
      prompt_position = 'top',
    },
    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
        }
    }
  }
  require('telescope').load_extension('fzy_native')
  require'telescope'.load_extension('dotfiles')

end

return config
