local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")
local util = require "lspconfig/util"

lspconfig.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {"gopls"},
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      -- https://go.googlesource.com/tools/+/refs/heads/gopls-release-branch.0.5/gopls/doc/settings.md
      matcher = "CaseSensitive", -- default "Fuzzy"
      completeUnimported = true,
      usePlaceholders = false,
      analyses = {
        unusedparams = true,
      },
    },
  },
}
