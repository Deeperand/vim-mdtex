# vim-mdtex
some useful command for markdown and LaTeX

## Illustrate
&emsp;&emsp;The using of this plug is like this:
![image](figure/vim-mdtex_illustrate.gif ) 

## Install
&emsp;&emsp;You can use any package manager to install `vim-mdtex`. With `vim-plug`, just add current code to your `vimrc`:

```vim
call plug#begin('~/.vim/plugged')
    Plug 'Deeperand/vim-mdtex', {'for': ['tex', 'markdown']}
call plug#end()
```

The content in file will just load the plug only if the file's type is `tex` or `markdown`. Then save `vimrc` and sorce it (or just restart *Vim*), and run `:PlugInstall`.

## Main Feature
### Words Modify
&emsp;&emsp;Use key such as `<localleader>b` to bold char under cursor in `NORMAL` mode or selected content in `VISUAL` mode. For LaTeX file, it will use `\textbf{<text>}`; for markdown file, it will use `**<text>**`.

### Markdown to LaTeX (or inverse)
&emsp;&emsp;Provide command to transfer markdown source code to LaTeX code or inverse. Such as transfer `**text**` to `\textbf{text}` or inverse
