" Vim syntax file
" Language: Scribble
" Maintainer: Nihcolas Ng
" Latest Revision: 21 Nov 2013
" Written for Scribble version 0.3 (18 Nov 2013) with Pabble extension
"

if exists("b:current_syntax")
  finish
endif

" Keywords
syn keyword scribbleKeyword     and as at by catches choice continue do from global import instantiates interruptible local module or par protocol rec role sig throws to type with
syn keyword pabbleKeyword       allreduce const except foreach group if in inf is oneof range repeat max
syn keyword scribbleType        role global local protocol const range

" Comments
syn keyword scribbleTodo        TODO FIXME XXX contained
syn region scribbleComment      start="/\*" end="\*/" contains=scribbleTodo,@Spell
syn match scribbleLineComment   "//.*$" contains=scribbleTodo,@Spell

" Message type
syn region scribbleMsgPayload   start=/(/ms=s+1 end=/)/me=s-1 contained
syn region scribbleMsgLabel     start="^\s*\w*(" end=")" keepend contained contains=scribbleMsgPayload,@Spell

" Blocks
syn region scribbleBlk          start="{" end="}" fold contains=scribbleKeyword,pabbleKeyword,scribbleLineComment,scribbleComment,scribbleMsgLabel,scribbleMsgPayload,scribbleBlk

hi def link scribbleKeyword     Keyword
hi def link pabbleKeyword       Keyword
hi def link scribbleType        Type
hi def link scribbleLineComment Comment
hi def link scribbleComment     Comment
hi def link scribbleTodo        Todo
hi def link scribbleMsgPayload  Label
hi def link scribbleMsgLabel    Function

let b:current_syntax = "scribble"
let b:spell_options  = "contained"
