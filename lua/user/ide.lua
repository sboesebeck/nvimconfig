local status_ok, ide = pcall(require, "ide")
if not status_ok then
  -- print("nvim_ide not installed!")
  return
end

-- default components
local explorer        = require('ide.components.explorer')
local outline         = require('ide.components.outline')
local callhierarchy   = require('ide.components.callhierarchy')
local timeline        = require('ide.components.timeline')
local terminal        = require('ide.components.terminal')
local terminalbrowser = require('ide.components.terminal.terminalbrowser')
local changes         = require('ide.components.changes')
local commits         = require('ide.components.commits')
local branches        = require('ide.components.branches')
local bookmarks       = require('ide.components.bookmarks')

ide.setup({
    -- the global icon set to use.
    -- values: "nerd", "codicon", "default"
    -- icon_set = "default",
    icon_set ="nerd",
    -- place Component config overrides here. 
    -- they key to this table must be the Component's unique name and the value 
    -- is a table which overrides any default config values.
    components = {},
    -- default panel groups to display on left and right.
    panels = {
        left = "explorer",
        right = "git",
        bottom = "terminal"
    },
    -- panels defined by groups of components, user is free to redefine these
    -- or add more.
    panel_groups = {
        explorer = { outline.Name, explorer.Name, callhierarchy.Name },
        -- explorer = { outline.Name, explorer.Name, bookmarks.Name, callhierarchy.Name, terminalbrowser.Name },
        btm = { bookmarks.Name,terminalbrowser.Name},
        terminal = { terminal.Name },
        -- git = { changes.Name, commits.Name, timeline.Name, branches.Name }
    }
})
