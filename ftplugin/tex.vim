" text modify (capital: with space)
    " math selected content
        vnoremap <buffer> <localleader>m c$<C-r>"$<ESC>
        nnoremap <buffer> <localleader>m vc$<C-r>"$<ESC>
        vnoremap <buffer> <localleader>M c<space>$<C-r>"$<space><ESC>
        nnoremap <buffer> <localleader>M vc<space>$<C-r>"$<space><ESC>

    " code selected content
        vnoremap <buffer> <localleader>c c\Code{<C-r>"}<ESC>
        nnoremap <buffer> <localleader>c vc\Code{<C-r>"}<ESC>
        vnoremap <buffer> <localleader>C c<space>\Code{<C-r>"}<space><ESC>
        nnoremap <buffer> <localleader>C vc<space>\Code{<C-r>"}<space><ESC>

    " bold selected content
        vnoremap <buffer> <localleader>b c\textbf{<C-r>"}<ESC>
        nnoremap <buffer> <localleader>b vc\textbf{<C-r>"}<ESC>
        vnoremap <buffer> <localleader>B c<space>\textbf{<C-r>"}<space><ESC>
        nnoremap <buffer> <localleader>B vc<space>\textbf{<C-r>"}<space><ESC>

    " italic selected content
        vnoremap <buffer> <localleader>i c\textsl{<C-r>"}<ESC>
        nnoremap <buffer> <localleader>i vc\textsl{<C-r>"}<ESC>
        vnoremap <buffer> <localleader>I c<space>\textsl{<C-r>"}<space><ESC>
        nnoremap <buffer> <localleader>I vc<space>\textsl{<C-r>"}<space><ESC>

    " under-wave selected content
        vnoremap <buffer> <localleader>u c\CJKunderwave{<C-r>"}<ESC>
        nnoremap <buffer> <localleader>u vc\CJKunderwave{<C-r>"}<ESC>
        vnoremap <buffer> <localleader>U c<space>\CJKunderwave{<C-r>"}<space><ESC>
        nnoremap <buffer> <localleader>U vc<space>\CJKunderwave{<C-r>"}<space><ESC>

    " just add space
        vnoremap <buffer> <localleader>s c<space><C-r>"<space><ESC>
        nnoremap <buffer> <localleader>s vc<space><C-r>"<space><ESC>

    " delete next modify
        " nnoremap <localleader>d :s/\v\\\a{-}\{(.{-})}/\1<CR>
        nnoremap <buffer> <localleader>d t\df{f}xx
        nnoremap <buffer> <localleader>D f\df{f}x
