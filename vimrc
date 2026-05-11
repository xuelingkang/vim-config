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

