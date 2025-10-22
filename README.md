# my_nvim
[![Neovim](https://img.shields.io/badge/Neovim-0.8%2B-blue)](https://neovim.io/)
[![License](https://img.shields.io/badge/License-MIT-green)](https://github.com/chevil-dev/my_nvim/blob/main/LICENSE)
[![Stars](https://img.shields.io/github/stars/chevil-dev/my_nvim?style=social)](https://github.com/chevil-dev/my_nvim/stargazers)

A clean, fast, and fully modular Neovim configuration written in Lua, tailored for developers who want a productive and extensible workflow.

## ✨ Features

- 📦 **Plugin Management** with [lazy.nvim](https://github.com/folke/lazy.nvim)
- 🧠 **LSP & Completion** via `mason.nvim`, `nvim-lspconfig`, and `nvim-cmp`
- 🎨 **UI Enhancements** with `lualine`, `nvim-tree`, `indent-blankline`, etc.
- 🪄 **Fuzzy Finding** using `telescope.nvim` and `ripgrep`
- 🧪 **Tree-sitter** for syntax-aware code highlighting and editing
- 🖼️ **Icon Support** with Nerd Fonts
- ⚡ **Fast Startup** and lazy-loading for optimal performance
- 🛠️ **Custom Keymaps** and intuitive file structure

---

## 📁 File Structure

my_nvim/

- ├── init.lua
- ├── lua/
- │ ├── configs/
- │ ├── plugins/
- ├── lazy-lock.json
- └── README.md


---

## 🧩 Plugin Categories

Here’s how plugins are typically organized:

- `core.lua` – Base settings like `vim.o` options and leader keys
- `plugins/init.lua` – Plugin definitions and lazy.nvim setup
- `plugins/lsp.lua` – LSP, formatting, diagnostics
- `plugins/cmp.lua` – Autocompletion config
- `plugins/ui.lua` – Status line, icons, colorschemes
- `plugins/tools.lua` – Git, file browsing, navigation

---

## 🚀 Getting Started

### 1. Install Prerequisites

Make sure you have the following tools:

- [Neovim 0.9+](https://github.com/neovim/neovim/releases)
- [Git](https://git-scm.com/)
- [Ripgrep](https://github.com/BurntSushi/ripgrep)
- [Nerd Font](https://www.nerdfonts.com/) (e.g., FiraCode Nerd Font)

### 2. Install the Config
#### 1.Clone the repository to your Neovim configuration directory:
```bash
git clone https://github.com/chevil-dev/my_nvim.git ~/.config/nvim
nvim
```
#### 2.Launch Neovim and sync plugins:
```vim
:Lazy sync
```
#### 3.Restart Neovim to apply all configurations.

## 🧩 Customization
This configuration is fully modular:
- Add or modify plugins in `lua/plugins/`.
- Customize individual plugin settings in `lua/configs/`.
- Keymaps and options are easy to adjust for personal workflow.
## 🤝 Contributions
Contributions are welcome!
- Fork the repository
- Make your changes
- Submit a Pull Request
Please ensure contributions maintain performance, modularity, and code clarity.
