" Vim syntax file
" Language: Scribble
" Maintainer: Nihcolas Ng
" Latest Revision: 18 Jul 2012
" Written for Scribble version 0.1 (18 Jul 2012)
"

if exists("b:current_syntax")
  finish
endif

" Keywords
syn keyword scribbleKeyword     and as at catch choice continue create do enter from import instantiates interruptible or par rec spawn throw to with
syn keyword scribbleType        role global local protocol

" Comments
syn keyword scribbleTodo        TODO FIXME XXX contained
syn region scribbleComment      start="/\*" end="\*/" contains=scribbleTodo,@Spell
syn match scribbleLineComment   "//.*$" contains=scribbleTodo,@Spell

" Message type
syn region scribbleMsgPayload   start=/(/ms=s+1 end=/)/me=s-1 contained
syn region scribbleMsgLabel     start="\w*(" end=")" keepend contained contains=scribbleMsgPayload,@Spell

" Blocks
syn region scribbleBlk          start="{" end="}" fold contains=scribbleKeyword,scribbleLineComment,scribbleComment,scribbleMsgLabel,scribbleMsgPayload,scribbleBlk

hi def link scribbleKeyword     Keyword
hi def link scribbleType        Type
hi def link scribbleLineComment Comment
hi def link scribbleComment     Comment
hi def link scribbleTodo        Todo
hi def link scribbleMsgPayload  Label
hi def link scribbleMsgLabel    Function

let b:current_syntax = "scribble"
let b:spell_options  = "contained"
