hi Tag       ctermfg=Black
hi TagNamed  ctermfg=DarkGreen
hi TagEnd    ctermfg=Black
hi TagClosed ctermfg=DarkGreen

syn match Tag    "\[<" conceal cchar=◁
syn match TagNamed    "\[.\+<" conceal cchar=◀
syn match TagEnd ">\]" conceal cchar=▷
syn match TagClosed  "\[.*<\]" conceal cchar=▼

