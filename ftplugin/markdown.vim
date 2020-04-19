" text modify (capital: with space)
    " math selected content
        vnoremap <localleader>m c$<C-r>"$<ESC>
        nnoremap <localleader>m vc$<C-r>"$<ESC>
        vnoremap <localleader>M c<space>$<C-r>"$<space><ESC>
        nnoremap <localleader>M vc<space>$<C-r>"$<space><ESC>

    " code selected content
        vnoremap <localleader>c c`<C-r>"`<ESC>
        nnoremap <localleader>c vc`<C-r>"`<ESC>
        vnoremap <localleader>C c<space>`<C-r>"`<space><ESC>
        nnoremap <localleader>C vc<space>`<C-r>"`<space><ESC>

    " bold selected content
        vnoremap <localleader>b c**<C-r>"**<ESC>
        nnoremap <localleader>b vc**<C-r>"**<ESC>
        vnoremap <localleader>B c<space>**<C-r>"**<space><ESC>
        nnoremap <localleader>B vc<space>**<C-r>"**<space><ESC>

    " italic selected content
        vnoremap <localleader>i c*<C-r>"*<ESC>
        nnoremap <localleader>i vc*<C-r>"*<ESC>
        vnoremap <localleader>I c<space>*<C-r>"*<space><ESC>
        nnoremap <localleader>I vc<space>*<C-r>"*<space><ESC>

    " under-line selected content
        vnoremap <localleader>u c<u><C-r>"</u><ESC>
        nnoremap <localleader>u vc<u><C-r>"</u><ESC>
        vnoremap <localleader>U c<space><u><C-r>"</u><space><ESC>
        nnoremap <localleader>U vc<space><u><C-r>"</u><space><ESC>

    " just add space
        vnoremap <localleader>s c<space><C-r>"<space><ESC>
        nnoremap <localleader>s vc<space><C-r>"<space><ESC>

    " delete next latex modify
        " nnoremap <localleader>d :s/\v\\\a{-}\{(.{-})}/\1<CR>
        nnoremap <localleader>d t\df{f}xx
        nnoremap <localleader>D f\df{f}x
