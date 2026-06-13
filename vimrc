source ~/.commonvimrc

" 退出编辑模式自动切换为英文输入法
function! InputMethodEn()
    if has('mac')
        let l:a = system("InputSourceSelector select com.apple.keylayout.ABC")
    elseif has('linux') && executable('fcitx5-remote')
        let l:a = system("fcitx5-remote -c")
    endif
endfunction
set ttimeoutlen=100
autocmd InsertLeave * call InputMethodEn()

" WSL 剪贴板：直通 wsl-copy/wsl-paste，不走 X11（绕开 CRLF ^M 问题）
if has("unix") && filereadable("/proc/version")
  let s:wsl_check = readfile("/proc/version")
  if join(s:wsl_check) =~ "Microsoft"
    set clipboard=
    let s:wsl_regtype = ''
    autocmd TextYankPost * call system('~/.vim-config/wsl-bin/wsl-copy', join(v:event.regcontents, "\n")) | let s:wsl_regtype = v:event.regtype
    function! WslPaste(mode) abort
      let @" = substitute(system('~/.vim-config/wsl-bin/wsl-paste'), "\r", '', 'g')
      if s:wsl_regtype ==# 'V' && @" !~ '\n$'
        let @" = @" . "\n"
      endif
      return a:mode
    endfunction
    nnoremap <expr> p WslPaste('p')
    nnoremap <expr> P WslPaste('P')
  endif
endif
