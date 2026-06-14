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

# macOS: build macism (input source switcher)
make -C ~/.vim-config macism
```

## Input method auto-switch

Switch to English input method on `InsertLeave`, adapted per platform:

| Platform | Mechanism | Command |
|----------|-----------|---------|
| macOS    | `macism` (submodule) | `mac-bin/macism com.apple.keylayout.ABC` |
| WSL      | `weasel-mode` (submodule) | `wsl-bin/weasel-mode ascii` |
| Linux    | `fcitx5-remote` | `fcitx5-remote -c` |

## WSL clipboard

Bypass X11 and interact with the Windows clipboard directly via `wsl-bin/wsl-copy` / `wsl-paste`, avoiding CRLF `^M` corruption.

## Submodules

- `pack/` — vim plugins (easymotion, nerdtree, surround, startify, airline, dracula, etc.)
- `wsl-bin` — WSL utilities ([xuelingkang/wsl-bin](https://github.com/xuelingkang/wsl-bin))
- `macism` — macOS input source switcher ([laishulu/macism](https://github.com/laishulu/macism))

