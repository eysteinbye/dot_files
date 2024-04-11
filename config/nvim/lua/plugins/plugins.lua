return {
  -- {
  --   -- Nice pastel colorscheme
  --   "catppuccin/nvim",
  --   name = "catppuccin",
  --   priority = 1000,
  -- },
  --
  {
    -- Vim Status line on steroids
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  {
    -- jq
    "jrop/jq.nvim",
  },
  {
    -- Automatic session management
    "rmagatti/auto-session",
    opts = {
      log_level = "info",
      -- Loads the last loaded session if session for cwd does not exist
      auto_session_enable_last_session = false,
      auto_session_use_git_branch = false,
      auto_session_root_dir = vim.fn.stdpath("data") .. "/sessions/",
      auto_session_enabled = true,
      auto_save_enabled = true,
      auto_restore_enabled = true,
      -- Suppress session create/restore if in one of the list of dirs
      auto_session_suppress_dirs = nil,
      -- Suppress session create/restore if only filetypes in the list
      bypass_session_save_file_types = nil,
    },
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
  -- {
  --   -- Treesitter
  --   "nvim-treesitter/nvim-treesitter",
  -- },
  {
    -- CoPilot
    "github/copilot.vim",
  },
  {
    -- Git blame inline
    "f-person/git-blame.nvim",
    event = "VeryLazy",
  },
  {
    -- Zen mode
    "folke/zen-mode.nvim",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
  {
    {
      -- :LazyGit or Cmd+G
      -- Git client
      "kdheepak/lazygit.nvim",
      cmd = {
        "LazyGit",
        "LazyGitConfig",
        "LazyGitCurrentFile",
        "LazyGitFilter",
        "LazyGitFilterCurrentFile",
      },
      -- optional for floating window border decoration
      dependencies = {
        "nvim-lua/plenary.nvim",
      },
      -- setting the keybinding for LazyGit with 'keys' is recommended in
      -- order to load the plugin when the command is run for the first time
      keys = {
        -- { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
        { "<cmd>LazyGit<cr>", desc = "LazyGit" },
      },
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      -- add a keymap to browse plugin files
      -- stylua: ignore
      {
        "<leader>fp",
        function() require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root }) end,
        desc = "Find Plugin File",
      },
    },
    -- change some options
    opts = {
      defaults = {
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 0,

        -- NB! It also ignores files from the `.ignore` file
        file_ignore_patterns = {
          -- Files
          "Library/",
          ".DS_Store",
          "%.cont",
          "%.MOV",
          "%.mov",
          "%.tga",
          "%.tmb",
          "%.mpg",
          "%.mp3",
          "%.m4a",
          "%.MP4",
          "%.mp4",
          "%.3gp",
          "%.WAV",
          "%.AVI",
          "%.PNG",
          "%.a",
          "%.class",
          "%.mkv",
          "%.jpg",
          "%.JPG",
          "%.jpeg",
          "%.png",
          "%.gif",
          "%.zip",
          "%.gz",
          "%.tar",
          "%.7z",
          "%.rar",
          "%.o",
          "%.out",
          "%.pdf",
          "%.zip",
          -- Directories
          ".cache",
          ".git/",
          ".github/",
          ".node_modules/",
        },
      },
    },
  },
}
