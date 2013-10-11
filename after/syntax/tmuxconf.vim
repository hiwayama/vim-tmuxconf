" ==================================================
" after/syntax/tmuxconf.vim
"
" Author: Hiromasa IWAYAMA
" ==================================================

let b:current_syntax = ""
unlet b:current_syntax

if exists("g:loaded_vim_tmuxconf")
  finish
endif
let g:loaded_vim_tmuxconf=1

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn case match

syn match tmuxConfig /set\(-window\)\?\(-option\)\?/ nextgroup=tmuxFlag skipwhite
syn match tmuxConfig /\(un\)\?bind\(-key\)\?/ nextgroup=tmuxFlag skipwhite
syn keyword tmuxConfig display nextgroup=tmuxFlag skipwhite
syn match tmuxFlag /\s-\w\+/
syn match tmuxComment "#.*"
syn match tmuxType /\son\|off/
syn match tmuxString /".*"/
syn match tmuxLiteral /\s\d\+/

hi link tmuxConfig Keyword
hi link tmuxComment Comment
hi link tmuxFlag Tag
hi link tmuxType    Type
hi link tmuxString  String
hi link tmuxLiteral Constant
hi link tmuxOption Tag

let b:current_syntax = "tmuxconf"

