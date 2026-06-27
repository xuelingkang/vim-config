# vim-config

## Setup

```
git clone --recursive https://github.com/xuelingkang/vim-config ~/.vim-config
mkdir -p ~/.vim
ln -s ~/.vim-config/pack ~/.vim/pack
ln -s ~/.vim-config/commonvimrc ~/.commonvimrc
ln -s ~/.vim-config/vimrc ~/.vimrc
ln -s ~/.vim-config/ideavimrc ~/.ideavimrc
mkdir -p ~/.vim/{.backup,.swp,.undo}
```

## Input method auto-switch

Switch to English input method on `InsertLeave`, adapted per platform:

| Platform | Mechanism | Command |
|----------|-----------|---------|
| macOS    | `squirrel-mode` (submodule) | `mac-bin/squirrel-mode ascii` |
| WSL      | `weasel-mode` (submodule) | `wsl-bin/weasel-mode ascii` |
| Linux    | `fcitx5-remote` | `fcitx5-remote -c` |

### Vim

`vimrc` defines `InputAscii()`, called via `autocmd InsertLeave *`.

### Tmux

`pane-focus-in` hook calls `bin/input-ascii` directly.

### IdeaVim

`ideavimrc` uses `autocmd InsertLeave * :action Tool_External Tools_InputAscii` to trigger an IntelliJ External Tool, avoiding shell command output.

**Setup:** IntelliJ → Settings → Tools → External Tools → add:

| Field | Value |
|-------|-------|
| Name | `InputAscii` |
| Program | `$USER_HOME$/.vim-config/bin/input-ascii` |
| Arguments | (empty) |
| Open console | ❌ unchecked |

The wrapper script `bin/input-ascii` dispatches per platform and is shared by tmux and the External Tool.

## WSL clipboard

Bypass X11 and interact with the Windows clipboard directly via `wsl-bin/wsl-copy` / `wsl-paste`, avoiding CRLF `^M` corruption.

## Submodules

- `pack/` — vim plugins (easymotion, nerdtree, surround, startify, airline, dracula, etc.)
- `wsl-bin` — WSL utilities ([xuelingkang/wsl-bin](https://github.com/xuelingkang/wsl-bin))
- `mac-bin` — Squirrel mode switch script ([xuelingkang/mac-bin](https://github.com/xuelingkang/mac-bin))
