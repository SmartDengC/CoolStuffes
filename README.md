# CoolStuffes - 高效工作流配置

> 一套提升 macOS 开发效率的个人配置集合

## 简介

本仓库收录了我在日常开发中使用的高效率配置文件，涵盖键盘映射、窗口管理、编辑器配置、Shell 环境等多个方面。

## 目录结构

```
CoolStuffes/
├── hammerspoon/     # macOS 自动化工具
├── karabiner/       # 键盘映射
├── lazyvim/         # Neovim 配置
├── ideavim/         # JetBrains IDE Vim 插件配置
├── zsh/             # Zsh 配置
├── opencode/        # OpenCode AI 助手配置
└── openclaw/       # OpenClaw 自定义技能
```

## 功能特性

| 工具 | 说明 |
|------|------|
| **Hammerspoon** | macOS 自动化脚本，包括应用快速切换、窗口管理等 |
| **Karabiner** | 键盘映射规则，自定义 Hyper Key、增强修饰键等 |
| **LazyVim** | Neovim 发行版配置，开箱即用的 IDE 体验 |
| **IDEAVim** | JetBrains IDE 的 Vim 模拟配置 |
| **Zsh** | Shell 环境配置，包含 oh-my-zsh 自定义 |
| **OpenCode** | OpenCode AI 助手的模型和提供商配置 |
| **OpenClaw** | 自定义技能（金融资讯、股票价格查询） |

## 快速开始

### 部署配置

```bash
# 克隆仓库
git clone https://github.com/yourusername/CoolStuffes.git
cd CoolStuffes

# 部署 Hammerspoon
cp -r ./hammerspoon/* ~/.hammerspoon

# 部署 Karabiner
cp -r ./karabiner/* ~/.config/karabiner

# 部署 LazyVim
cp -r ./lazyvim ~/.config/nvim

# 部署 zsh
cp ./zsh/zshrc ~/.zshrc

# 部署 IDEAVim
cp ./ideavim/ideavimrc ~/.ideavimrc
```

### 备份配置

```bash
# 备份到仓库
cp -r ~/.hammerspoon/* ./hammerspoon
cp -r ~/.config/karabiner/* ./karabiner
cp -r ~/.config/nvim/* ./lazyvim
```

## 配置验证

### JSON 文件
```bash
python3 -m json.tool karabiner/karabiner.json > /dev/null
python3 -m json.tool opencode/opencode.json > /dev/null
```

### Lua 文件
```bash
luac -p hammerspoon/init.lua
luac -p lazyvim/init.lua
```

## 许可证

MIT License
