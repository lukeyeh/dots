require 'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = { "lua", "rust" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  textobjects = {
    select = {
      enable = true,

      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,

      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        -- You can optionally set descriptions to the mappings (used in the desc parameter of
        -- nvim_buf_set_keymap) which plugins like which-key display
        ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
        -- You can also use captures from other query groups like `locals.scm`
        ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
      },

      selection_modes = {
        ['@parameter.outer'] = 'v', -- charwise
        ['@function.outer'] = 'V',  -- linewise
        ['@class.outer'] = '<c-v>', -- blockwise
      },

      include_surrounding_whitespace = true,
    },
  },

  refactor = {
    highlight_definitions = {
      enable = true,
      clear_on_cursor_move = true,
    },

    smart_rename = {
      enable = true,
      -- Assign keymaps to false to disable them, e.g. `smart_rename = false`.
      keymaps = {
        smart_rename = "grr",
      },
    },

    navigation = {
      enable = true,
      -- Assign keymaps to false to disable them, e.g. `goto_definition = false`.
      keymaps = {
        goto_definition = "gnd",
        list_definitions = "gnD",
        list_definitions_toc = "gO",
        goto_next_usage = "gnn",
        goto_previous_usage = "gnp",
      },
    },
  },
}

require 'treesitter-context'.setup {
  -- Enable this plugin (Can be enabled/disabled later via commands)
  enable = true,

  -- How many lines the window should span. Values <= 0 mean no limit.
  max_lines = 0,

  -- Minimum editor window height to enable context. Values <= 0 mean no limit.
  min_window_height = 0,

  line_numbers = true,

  -- Maximum number of lines to show for a single context
  multiline_threshold = 20,

  -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
  trim_scope = 'outer',

  -- Line used to calculate context. Choices: 'cursor', 'topline'
  mode = 'cursor',

  -- Separator between context and content. Should be a single character string, like '-'.
  -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
  separator = nil,

  -- The Z-index of the context window
  zindex = 20,

  -- (fun(buf: integer): boolean) return false to disable attaching
  on_attach = nil,
}


-- Enable contexts
vim.cmd "TSContextEnable"
