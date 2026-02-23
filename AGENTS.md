# AGENTS.md - CoolStuffes Configuration Repository

This repository contains personal configuration files for developer tools (Hammerspoon, Karabiner, LazyVim, IDEAVim, Zsh, OpenCode, OpenClaw).

## Validation Commands

### JSON Files (Karabiner, OpenCode)
```bash
python3 -m json.tool karabiner/karabiner.json > /dev/null
python3 -m json.tool opencode/opencode.json > /dev/null
```

### Lua Files (Hammerspoon, LazyVim)
```bash
luac -p hammerspoon/init.lua
luac -p lazyvim/init.lua
```

### Karabiner
Import in Karabiner > Preferences > Complex Modifications > Add rule (shows errors for invalid configs)

## Code Style Guidelines

### General
- 2 spaces for indentation
- Remove trailing whitespace
- Newline at end of file
- Lines under 120 characters

### JSON
- Double quotes for all strings
- No trailing commas
- Sort keys alphabetically

**Example:**
```json
{
  "title": "My Config",
  "rules": [
    {"description": "Remap caps to escape", "manipulators": []}
  ]
}
```

### Lua
- snake_case for variables/functions
- PascalCase for modules
- Explicit returns
- Use `---` for comments

**Example:**
```lua
local M = {}

M.setup = function(opts)
  local config = { option_a = true }
  return config
end

return M
```

### Hammerspoon
- Use `hs.` prefix for modules
- Group related configs into modules
- Comment hotkey combinations

### Karabiner Elements
- Follow Karabiner JSON schema
- Descriptive rule names
- Include `description` field for all rules

## Naming Conventions

| Type | Convention | Example |
|------|------------|---------|
| Files | snake_case | `my_config.lua` |
| Functions | snake_case | `setup_plugin()` |
| Variables | snake_case | `local config = {}` |
| Constants | UPPER_SNAKE | `MAX_RETRIES = 3` |
| Module names | PascalCase | `WindowManager` |
| JSON keys | camelCase | `"keyCode": "a"` |

## Making Changes

### Backup Before Modification
```bash
cp -r ~/.hammerspoon ~/.hammerspoon-backup-$(date +%Y%m%d)
cp -r ~/.config/karabiner ~/.config/karabiner-backup-$(date +%Y%m%d)
```

### Testing Changes
- **Hammerspoon**: Edit `hammerspoon/init.lua`, use `hs.reload()`
- **Karabiner**: Edit JSON, import in Karabiner Preferences
- **LazyVim**: Edit Lua files, restart Neovim or `:LazySync`
- **OpenCode**: Edit JSON config, restart OpenCode

### Deployment Commands
```bash
cp -r ./hammerspoon/* ~/.hammerspoon
cp -r ./karabiner/* ~/.config/karabiner
cp -r ./lazyvim ~/.config/nvim
cp -r ./zsh/* ~/
```

## API Keys and Secrets
Never commit actual keys. Use empty fields for templates:
```json
{ "apiKey": "" }
```
Add secrets to `.gitignore`, use template files.

## Notes for Agents
- This is a configuration dotfiles repository, not a software project
- No build/test commands - validate syntax manually
- Ask user before making changes to configuration files
