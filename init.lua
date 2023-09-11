return {
    -- Set dashboard header
    header = {
        "███    ██ ██    ██ ██ ███    ███",
        "████   ██ ██    ██ ██ ████  ████",
        "██ ██  ██ ██    ██ ██ ██ ████ ██",
        "██  ██ ██  ██  ██  ██ ██  ██  ██",
        "██   ████   ████   ██ ██      ██"
    },
    -- Configure AstroNvim updates
    updater = {
        remote = "origin", -- remote to use
        channel = "stable", -- "stable" or "nightly"
        version = "latest", -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
        branch = "main", -- branch name (NIGHTLY ONLY)
        commit = nil, -- commit hash (NIGHTLY ONLY)
        pin_plugins = nil, -- nil, true, false (nil will pin plugins on stable only)
        skip_prompts = false, -- skip prompts about breaking changes
        show_changelog = true, -- show the changelog after performing an update
        auto_quit = false, -- automatically quit the current session after a successful update
        remotes = { -- easily add new remotes to track
            --   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
            --   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
            --   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
        }
    },
    -- Set colorscheme to use
    colorscheme = "astrodark",
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {virtual_text = true, underline = true},
    lsp = {
        -- customize lsp formatting options
        formatting = {
            -- control auto formatting on save
            format_on_save = {
                enabled = true, -- enable or disable format on save globally
                allow_filetypes = { -- enable format on save for specified filetypes only
                    -- "go",
                },
                ignore_filetypes = { -- disable format on save for specified filetypes
                    -- "python",
                }
            },
            disabled = { -- disable formatting capabilities for the listed language servers
                -- "sumneko_lua",
            },
            timeout_ms = 1000 -- default format timeout
            -- filter = function(client) -- fully override the default formatting function
            --   return true
            -- end
        },
        -- enable servers that you already have installed without mason
        servers = {
            -- "pyright"
        }
        -- Add overrides for LSP server settings, the keys are the name of the server
    },
    -- Configure require("lazy").setup() options
    lazy = {
        defaults = {lazy = true},
        concurrency = 5, ---@type number limit the maximum amount of concurrent tasks
        git = {
            -- defaults for the `Lazy log` command
            -- log = { "-10" }, -- show the last 10 commits
            log = {"--since=3 days ago"}, -- show commits from the last 3 days
            timeout = 120, -- kill processes that take more than 2 minutes
            url_format = "https://github.com/%s.git",
            -- lazy.nvim requires git >=2.19.0. If you really want to use lazy with an older version,
            -- then set the below to false. This should work, but is NOT supported and will
            -- increase downloads a lot.
            filter = true
        },
        performance = {
            rtp = {
                -- customize default disabled vim plugins
                disabled_plugins = {
                    "tohtml", "gzip", "matchit", "zipPlugin", "netrwPlugin",
                    "tarPlugin", "matchparen"
                }
            }
        }
    },
    -- This function is run last and is a good place to configuring
    -- augroups/autocommands and custom filetypes also this just pure lua so
    -- anything that doesn't fit in the normal config locations above can go here
    polish = function()
        -- Set up custom filetypes
        -- vim.filetype.add {
        --   extension = {
        --     foo = "fooscript",
        --   },
        --   filename = {
        --     ["Foofile"] = "fooscript",
        --   },
        --   pattern = {
        --     ["~/%.config/foo/.*"] = "fooscript",
        --   },
        -- }
        vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
            pattern = {"*.text", "*.md", "*.tex"},
            command = "setlocal spell"
        })
        vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
            pattern = {"*.nf"},
            command = "set filetype=groovy"
        })
        vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
            pattern = {"*.py"},
            command = "set filetype=python"
        })
        vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
            pattern = {"*.qmd"},
            command = "set filetype=r"
        })
        vim.cmd [[
          set colorcolumn=80,120
          let g:VM_maps = {}
          let g:VM_maps['Find Under']         = '<C-d>'           " replace C-n
          let g:VM_maps['Find Subword Under'] = '<C-d>'           " replace visual C-n
        ]]
    end
}
