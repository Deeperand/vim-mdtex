" =========================FULL ANGLE TO HALF ANGLE=========================

    command! -range=% Full2Half <line1>,<line2>substitute/\v(，|。|（|）|？|！|：|；|“|”|‘|’|「|」)/\=g:full_angle_to_half_angle[submatch(1)]/g

    let g:full_angle_to_half_angle = {
        \ '，': ', ',
        \ '。': '. ',
        \ '（': ' (',
        \ '）': ') ',
        \ '？': '? ',
        \ '：': ': ',
        \ '；': '; ',
        \ '！': '! ',
        \ '“': '"',
        \ '”': '"',
        \ '「': ' "',
        \ '」': '" ',
        \ '‘': "'",
        \ '’': "'",
        \ }

" =========================MARKDOWN TO LaTeX=========================

" tranfer markdown to LaTeX
    " all
        command! -range=% Markdown2Tex silent <line1>,<line2>call <SID>transferMarkdown()
        command! -range=% Markdown2TexDanger silent <line1>,<line2>call <SID>transferDangerMarkdown()

        function! s:transferMarkdown() range abort
            " font
                execute(a:firstline . "," . a:lastline . "Markdown2TexBold")
                execute(a:firstline . "," . a:lastline . "Markdown2TexItalic")
                execute(a:firstline . "," . a:lastline . "Markdown2TexUnder")
                execute(a:firstline . "," . a:lastline . "Markdown2TexCodeInline")
            " quote (The order was important! Must transfer singlequote first and trans fer double quote second)
                execute(a:firstline . "," . a:lastline . "Markdown2TexSingleQuote")
                execute(a:firstline . "," . a:lastline . "Markdown2TexDoubleQuote")
            " environment
                execute(a:firstline . "," . a:lastline . "Markdown2TexCodeBlock")
                execute(a:firstline . "," . a:lastline . "Markdown2TexEquation")
            " title
                execute(a:firstline . "," . a:lastline . "Markdown2TexTitle")
            " paragraph space
                execute(a:firstline . "," . a:lastline . "Markdown2TexParagraphSpace")
            " list
                execute(a:firstline . "," . a:lastline . "Markdown2TexList")
            " figre
                execute(a:firstline . "," . a:lastline . "Markdown2TexFigure")
        endfunction

        function! s:transferDangerMarkdown() range abort
            " danger
                execute(a:firstline . "," . a:lastline . "Text2TexCirc")

            " safe
                execute(a:firstline . "," . a:lastline . "call <SID>transferMarkdown()")
        endfunction

    " font
        command! -range=% Markdown2TexBold silent! <line1>,<line2>substitute/\v\*\*(.{-})\*\*/\\textbf{\1}/g
        command! -range=% Markdown2TexItalic silent! <line1>,<line2>substitute/\v%(^|[^*])\zs\*([^*].{-})\*\ze%([^*]|$)/\\textsl{\1}/g
        command! -range=% Markdown2TexUnder silent! <line1>,<line2>substitute/\v\<u\>(.{-})\<\/u\>/\\CJKunderwave{\1}/g
        command! -range=% Markdown2TexCodeInline silent! <line1>,<line2>substitute/\v`([^`].{-})`/\\Code{\1}/g

    " quote
        command! -range=% Markdown2TexDoubleQuote silent! <line1>,<line2>substitute/\v"(.{-})"/``\1''/g
        command! -range=% Markdown2TexSingleQuote silent! <line1>,<line2>substitute/\v'(.{-})'/`\1'/g

    " block
        command! -range=% Markdown2TexCodeBlock silent! <line1>,<line2>substitute/\v```.*(\n%(.|\n){-})```.*/\\begin{lstlisting}[gobble = 8]\1\\end{lstlisting}/g
        command! -range=% Markdown2TexEquation silent! <line1>,<line2>substitute/\v\$\$.*(\n%(.|\n){-})\$\$.*/\\begin{equation}\1\\end{equation}/g

    " title
        command! -range=% Markdown2TexH2 silent! <line1>,<line2>substitute/\v##\s(.*)/\\section{\1}/g
        command! -range=% Markdown2TexH3 silent! <line1>,<line2>substitute/\v###\s(.*)/    \\subsection{\1}/g
        command! -range=% Markdown2TexH4 silent! <line1>,<line2>substitute/\v####\s(.*)/        \\paragraph{\1 \\\\}/g
        command! -range=% Markdown2TexH5 silent! <line1>,<line2>substitute/\v#####\s(.*)/        \\paragraph{\1 \\\\}/g
        command! -range=% Markdown2TexH6 silent! <line1>,<line2>substitute/\v######\s(.*)/        \\paragraph{\1 \\\\}/g
        command! -range=% Markdown2TexTitle silent! <line1>,<line2>call <SID>transferMarkdownTitle()

            function! s:transferMarkdownTitle() range abort
                " the order was important! Should tranfer low level title first!
                    execute(a:firstline . "," . a:lastline . "Markdown2TexH6")
                    execute(a:firstline . "," . a:lastline . "Markdown2TexH5")
                    execute(a:firstline . "," . a:lastline . "Markdown2TexH4")
                    execute(a:firstline . "," . a:lastline . "Markdown2TexH3")
                    execute(a:firstline . "," . a:lastline . "Markdown2TexH2")
            endfunction

    " paragraph space
        command! -range=% Markdown2TexParagraphSpace silent! <line1>,<line2>substitute/&emsp;&emsp;/\\hspace*{2em}/g

    " list
        command! -range=% Markdown2TexList silent! <line1>,<line2>substitute/\v(1\.|-)/\\item/g

    " figure
        command! -range=% Markdown2TexFigure silent! <line1>,<line2>substitute/\v\!\[.{-}]\((.{-})\)/\\includegraphics[width=.6\\textwidth]{\1}/g

    " danger: some words don't want to include may include)
        " for temprature like (such as -5° or +5° or 5°)
        command! -range=% Text2TexCirc silent! <line1>,<line2>substitute/\v([-+]?\d+)°/$\1^{\\circ}$/g
        command! -range=% Markdown2TexTilde silent! <line1>,<line2>substitute/\v[^`]\zs\~/$\\sim$/g

    " vary danger (may even effect the LaTeX source code )
        " physical unit
            command! -range=% Markdown2TexUnit silent! <line1>,<line2>substitute/\v(\d+)(\a+)/\1\\,\2/g

" =========================MARKDOWN TO MARKDOWN=========================

    " order list and unorder lise
        command! -range=% MarkdownOrder2Unorder silent! <line1>,<line2>substitute/1\./-/g
        command! -range=% MarkdownUnorder2order silent! <line1>,<line2>substitute/-/1./g


" =========================LaTeX TO MARKDOWN=========================

" transfer LaTeX to Markdown
    " all
        let g:mdtexListTransfer = 1

        command! -range=% Tex2Markdown silent <line1>,<line2>call <SID>transferTex()
        command! -range=% Tex2MarkdownDanger silent <line1>,<line2>call <SID>transferDangerTex()

            function! s:transferTex() range abort
                " font
                    execute(a:firstline . "," . a:lastline . "Tex2MarkdownBold")
                    execute(a:firstline . "," . a:lastline . "Tex2MarkdownItalic")
                    execute(a:firstline . "," . a:lastline . "Tex2MarkdownUnder")
                    execute(a:firstline . "," . a:lastline . "Tex2MarkdownCodeInline")
                " quote
                    execute(a:firstline . "," . a:lastline . "Tex2MarkdownDoubleQuote")
                    execute(a:firstline . "," . a:lastline . "Tex2MarkdownSingleQuote")
                " paragraph sapce
                    execute(a:firstline . "," . a:lastline . "Tex2MarkdownParagraphSpace")
                " environment
                    execute(a:firstline . "," . a:lastline . "Tex2MarkdownCodeBlock")
                    execute(a:firstline . "," . a:lastline . "Tex2MarkdownEquation")
                " title
                    execute(a:firstline . "," . a:lastline . "Tex2MarkdownTitle")
                " list
                    if g:mdtexListTransfer==1
                        execute(a:firstline . "," . a:lastline . "Tex2MarkdownOrderList")
                    else
                        execute(a:firstline . "," . a:lastline . "Tex2MarkdownUnorderList")
                    endif
                " figure
                    execute(a:firstline . "," . a:lastline . "Tex2MarkdownFigure")
                " delete (since will change line number, should put it at the last)
                    execute(a:firstline . "," . a:lastline . "Tex2MarkdownDelete")
            endfunction

            function! s:transferDangerTex() range abort
                " danger
                    execute(a:firstline . "," . a:lastline . "Text2MarkdownCirc")
                " safe
                    execute(a:firstline . "," . a:lastline . "call <SID>transferTex()")
            endfunction

    " font
        command! -range=% Tex2MarkdownBold silent! <line1>,<line2>substitute/\v\\textbf\{(.{-})}/**\1**/g
        command! -range=% Tex2MarkdownItalic silent! <line1>,<line2>substitute/\v\\textsl\{(.{-})}/*\1*/g
        command! -range=% Tex2MarkdownUnder silent! <line1>,<line2>substitute/\v\\CJKunderwave\{(.{-})}/<u>\1<\/u>/g
        command! -range=% Tex2MarkdownCodeInline silent! <line1>,<line2>substitute/\v\\Code\{(.{-})}/`\1`/g

    " quote
        command! -range=% Tex2MarkdownDoubleQuote silent! <line1>,<line2>substitute/\v``(.{-})''/"\1"/g
        command! -range=% Tex2MarkdownSingleQuote silent! <line1>,<line2>substitute/\v%([^`]|^)\zs`([^`].{-})'/'\1'/g

    " environment
        command! -range=% Tex2MarkdownEquation silent! <line1>,<line2>substitute/\v\\begin\{equation}.*(\n%(.|\n){-})\\end\{equation}.*/$$\1$$/g
        command! -range=% Tex2MarkdownCodeBlock silent! <line1>,<line2>substitute/\v\\begin\{lstlisting}.*(\n%(.|\n){-})\\end\{lstlisting}.*/```\1```/g

    " list
        command! -range=% Tex2MarkdownOrderList silent! <line1>,<line2>substitute/\v(\s*)\\item(.*)/\11.\2/g
        command! -range=% Tex2MarkdownUnorderList silent! <line1>,<line2>substitute/\v(\s*)\\item(.*)/\1-\2/g

    " title
        command! -range=% Tex2MarkdownSection silent! <line1>,<line2>substitute/\v\s*\\section\{(.{-})}/## \1/
        command! -range=% Tex2MarkdownSubsection silent! <line1>,<line2>substitute/\v\s*\\subsection\{(.{-})}/### \1/
        command! -range=% Tex2MarkdownParagraph silent! <line1>,<line2>substitute/\v\s*\\paragraph\{(.{-})\\\\?}/#### \1/
        command! -range=% Tex2MarkdownTitle silent! <line1>,<line2>call <SID>transferTexTitle()

            function! s:transferTexTitle() range abort
                    execute(a:firstline . "," . a:lastline . "Tex2MarkdownSection")
                    execute(a:firstline . "," . a:lastline . "Tex2MarkdownSubsection")
                    execute(a:firstline . "," . a:lastline . "Tex2MarkdownParagraph")
            endfunction

    " paragraph sapce
        command! -range=% Tex2MarkdownParagraphSpace silent! <line1>,<line2>substitute/\v\s*\\hspace\*?\{2em}/\&emsp;\&emsp;/g

    " figure
        command! -range=% Tex2MarkdownFigure silent! <line1>,<line2>substitute/\v\\includegraphics%(\[.{-}])?\{(.{-})}/![image](\1)/g

    " delete list environment and labeled line
        command! -range=% Tex2MarkdownDelete silent! <line1>,<line2>glob/\v(\\(begin|end)\{(enumerate|itemize|figure)}|\\label|\\centering)/d

    " danger
        " just a alias of `Text2TexCirc`
        command! -range=% Text2MarkdownCirc silent! <line1>,<line2>Text2TexCirc

