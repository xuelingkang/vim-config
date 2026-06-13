" ============================================================
" WSL 剪贴板配置备份（2026-06-14）
" 臃肿版 deprecated，保留供参考
" ============================================================
" WSL: 不走 X11 剪贴板（WSLg 桥接 CRLF 有 ^M 问题），全部直通 wsl-copy/wsl-paste
" if has("unix") && filereadable("/proc/version")
"   let s:wsl_check = readfile("/proc/version")
"   if join(s:wsl_check) =~ "Microsoft"
"     set clipboard=
"     let s:wsl_last_type = ''
"     autocmd TextYankPost *
"       \ if index(['y', 'd', 'x'], v:event.operator) >= 0 |
"       \   let s:wsl_last_type = v:event.regtype |
"       \   call system('~/.local/bin/wsl-copy', join(v:event.regcontents, "\n")) |
"       \ endif
"     function! WslPaste(mode) abort
"       let l:clip = system('~/.local/bin/wsl-paste')
"       let l:clip = substitute(l:clip, "\r", '', 'g')
"       if s:wsl_last_type ==# 'V' && l:clip !~ '\n$'
"         let l:clip = l:clip . "\n"
"       endif
"       let @" = l:clip
"       let @+ = l:clip
"       return a:mode
"     endfunction
"     nnoremap <expr> p WslPaste('p')
"     nnoremap <expr> P WslPaste('P')
"   endif
" endif
