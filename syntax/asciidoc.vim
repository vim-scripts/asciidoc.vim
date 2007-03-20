" Vim syntax file
" Language: Asciidoc style

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif



syn match asciidocName     /^\w*\u\w*[a-z0-9]\w*\u\w*/
syn match asciidocRule     /^-\{4,}/
syn match asciidocBullet   /^\s*[\*\-]\s/
syn match asciidocNumItem  /^\(\s\)\+\d\+[.)]\s/
syn keyword asciidocToDo   TODO ToDo FIXME FixMe
syn match asciidocEmail    /\S\+@\S\+\(.\S+\)*/
syn match asciidocSpecialChar /{amp}\w+;/

syn region asciidocL0 start="^=" end="$"
syn region asciidocL1 start="^==" end="$"
syn region asciidocL2 start="^===" end="$"
syn region asciidocL3 start="^====" end="$"
syn region asciidocL4 start="^=====" end="$"

syn region asciidocL0 start="^=" end="=$" oneline
syn region asciidocL1 start="^-" end="-$" oneline
syn region asciidocL2 start="^\~" end="\~$" oneline
syn region asciidocL3 start="^\^" end="\^$" oneline
syn region asciidocL4 start="^+" end="+$" oneline
syn region asciidocDefinition start="^" end="::$" oneline
syn match asciidocRef 	/<<[a-zA-Z0-9,]*>>/
syn match asciidocFon 	/footnote:\[.*\]/
syn match asciidocLink 	/\(http\|https\|gopher\|mailto\|news\|ftp\|file\):.*\]/
syn match asciidocMacro 	/\[\[.*\]\]/
syn match asciidocComment	/^\ *\/\/.*$/
"syn region asciidocBold start="\*\{1}" end="\*\{1}"
"syn region asciidocItalic start="\'\{1}[^\']"  end="\'\{1}\([^\']\|$\)"
syn region asciidocMeta start="^#" end="$" oneline
syn region asciidocCommentBlk start="^////\+$" end="^////\+$"

if version <= 508 || !exists("did_asciidoc_syntax_inits")
  if version < 508
    let did_asciidoc_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink asciidocL0          Title
  HiLink asciidocL1          asciidocL0
  HiLink asciidocL2          asciidocL1
  HiLink asciidocL3          asciidocL2
  HiLink asciidocL4          asciidocL3
  HiLink asciidocRef         PreProc
  HiLink asciidocMacro       Identifier
  HiLink asciidocLink        Underlined 
  HiLink asciidocEmail       PreProc
  HiLink asciidocBullet      Identifier
  HiLink asciidocFon         Label
  HiLink asciidocRule        Identifier
  HiLink asciidocNumItem     Label
"  HiLink asciidocBold        Type
"  HiLink asciidocItalic      SpecialKey
  HiLink asciidocMeta        Comment
  HiLink asciidocToDo        Todo
  HiLink asciidocComment     Comment
  HiLink asciidocCommentBlk  Comment
  HiLink asciidocDefinition  Label
  HiLink asciidocSpecialChar Identifier
      
  delcommand HiLink
endif

let b:current_syntax = "asciidoc"

"eof
