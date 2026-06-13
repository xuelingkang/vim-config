source ~/.commonvimrc

" 退出编辑模式自动切换为英文输入法
function! InputMethodEn()
    if has('mac')
        let l:a = system("InputSourceSelector select com.apple.keylayout.ABC")
    elseif has('linux')
        let l:a = system("fcitx5-remote -c")
    endif
endfunction
set ttimeoutlen=100
autocmd InsertLeave * call InputMethodEn()


" WSL Windows 剪贴板同步（y/p 直接走 Windows 剪贴板）
if has("unix") && filereadable("/proc/version")
  let s:wsl_check = readfile("/proc/version")
  if join(s:wsl_check) =~ "Microsoft"
    autocmd TextYankPost * if v:event.operator == 'y' | call system('~/.local/bin/wsl-copy', join(v:event.regcontents, "\n")) | endif
    nnoremap p :let @" = substitute(system('~/.local/bin/wsl-paste'), '\r', '', 'g')<CR>p
    nnoremap P :let @" = substitute(system('~/.local/bin/wsl-paste'), '\r', '', 'g')<CR>P
  endif
endif

