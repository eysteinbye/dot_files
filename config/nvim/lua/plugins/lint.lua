return {
  {
    -- Will disable the following lint rules
    "mfussenegger/nvim-lint",
    opts = {
      linters = {
        markdownlint = {
          -- https://github.com/DavidAnson/markdownlint/blob/main/doc/md013.md
          args = { "--disable", "MD034", "MD032", "MD025", "MD022", "MD018", "MD013", "MD012", "MD009", "--" },
        },
      },
    },
  },
}
