" tranfer markdown to LaTeX 
    command! -range=% Markdownd2TexAll silent <line1>,<line2>call <SID>transferAll()
    command! -range=% Markdownd2TexAllDanger silent <line1>,<line2>call <SID>transferAllDanger()
    command! -range=% Markdownd2TexBold silent! <line1>,<line2>substitute/\v\*\*(.{-})\*\*/\\textbf{\1}/g
    command! -range=% Markdownd2TexCodeBlock silent! <line1>,<line2>substitute/\v```.*(\n%(.|\n){-})```.*/\\begin{lstlisting}[gobble = 8]\1\\end{lstlisting}/g
    command! -range=% Markdownd2TexCodeInline silent! <line1>,<line2>substitute/\v`(.{-})`/\\Code{\1}/g
    command! -range=% Markdownd2TexDoubleQuote silent! <line1>,<line2>substitute/\v"(.{-})"/``\1''/g
    command! -range=% Markdownd2TexEquation silent! <line1>,<line2>substitute/\v\$\$.*(\n%(.|\n){-})\$\$.*/\\begin{equation}\1\\end{equation}/g
    command! -range=% Markdownd2TexItalic silent! <line1>,<line2>substitute/\v%(^|[^*])\zs\*([^*].{-})\*\ze%([^*]|$)/\\textsl{\1}/g
    command! -range=% Markdownd2TexSingleQuote silent! <line1>,<line2>substitute/\v'(.{-})'/`\1'/g

    " danger: some words don't want to include may include)
        " for temprature like (such as -5° or +5° or 5°)
        command! -range=% Text2TexCirc silent! <line1>,<line2>substitute/\v([-+]?\d+)°/$\1^{\\circ}$/g
        command! -range=% Markdownd2TexTiled silent! <line1>,<line2>substitute/\v[^`]\zs\~/$\\sim$/g

    " vary danger (may even effect the LaTeX source code )
        " physical unit
        command! -range=% Markdownd2TexUnit silent! <line1>,<line2>substitute/\v(\d+)(\a+)/\1\\,\2/g

    function! s:transferAll() range abort
        execute(a:firstline . "," . a:lastline . "Markdownd2TexBold")
        execute(a:firstline . "," . a:lastline . "Markdownd2TexCodeBlock")
        execute(a:firstline . "," . a:lastline . "Markdownd2TexCodeInline")
        execute(a:firstline . "," . a:lastline . "Markdownd2TexDoubleQuote")
        execute(a:firstline . "," . a:lastline . "Markdownd2TexEquation")
        execute(a:firstline . "," . a:lastline . "Markdownd2TexItalic")
        execute(a:firstline . "," . a:lastline . "Markdownd2TexSingleQuote")
    endfunction

    function! s:transferAllDanger() range abort
        execute(a:firstline . "," . a:lastline . "Markdownd2TexBold")
        execute(a:firstline . "," . a:lastline . "Markdownd2TexCodeBlock")
        execute(a:firstline . "," . a:lastline . "Markdownd2TexCodeInline")
        execute(a:firstline . "," . a:lastline . "Markdownd2TexCirc")
        execute(a:firstline . "," . a:lastline . "Markdownd2TexDoubleQuote")
        execute(a:firstline . "," . a:lastline . "Markdownd2TexEquation")
        execute(a:firstline . "," . a:lastline . "Markdownd2TexItalic")
        execute(a:firstline . "," . a:lastline . "Markdownd2TexSingleQuote")
        execute(a:firstline . "," . a:lastline . "Markdownd2TexTiled")
    endfunction
