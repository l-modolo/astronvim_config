return {
    -- You can also add new plugins here as well:
    -- Add plugins, the lazy syntax
    -- "andweeb/presence.nvim",
    -- {
    --   "ray-x/lsp_signature.nvim",
    --   event = "BufRead",
    --   config = function()
    --     require("lsp_signature").setup()
    --   end,
    -- },

    {
        "nvim-neo-tree/neo-tree.nvim",
        opts = {
            filesystem = {
                filtered_items = {
                    visible = true,
                    hide_dotfiles = false,
                    hide_gitignored = false,
                    hide_by_name = {
                        ".DS_Store", "thumbs.db", "node_modules", "__pycache__"
                    }
                },
                follow_current_file = true,
                hijack_netrw_behavior = "open_current",
                use_libuv_file_watcher = true
            }
        }
    }, "mg979/vim-visual-multi", "teto/vim-listchars",
    "simrat39/rust-tools.nvim", "rust-lang/rust.vim", "hrsh7th/vim-vsnip",
    "vim-autoformat/vim-autoformat", "xiyaowong/virtcolumn.nvim",
    "Mxrcon/nextflow-vim", "vladdoster/remember.nvim", {
        "quarto-dev/quarto-nvim",
        opts = {
            requires = {"jmbuhr/otter.nvim", "neovim/nvim-lspconfig"},
            config = function()
                require("quarto").setup {
                    debug = false,
                    closePreviewOnExit = true,
                    lspFeatures = {
                        enabled = true,
                        languages = {"r", "python", "julia"},
                        chunks = 'curly',
                        diagnostics = {enabled = true, triggers = {"BufWrite"}},
                        completion = {enabled = true}
                    }
                    keymap = {
                        hover = 'K',
                        definition = 'gd',
                        rename = '<leader>lR',
                        references = 'gr',
                    }
                }
            end
        }
    }, "HiPhish/nvim-ts-rainbow2", 'hrsh7th/nvim-cmp'
}
