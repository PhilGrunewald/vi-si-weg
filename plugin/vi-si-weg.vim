" vi-si-weg

fu! Visiweg()
  silent normal "tyi[
  let tag = @t
  if tag[0] == '<' && tag[-1:-1] == '>'
    " new tag to be created & closed
    if (stridx(g:TagLeader,'/') > -1) && (!isdirectory(split(g:TagLeader,'/')[0]))
      " tag is a non-existing subfolder
        silent execute expand("!mkdir ".split(g:TagLeader,'/')[0])
    endif
    let i = 1
    while filereadable(g:TagLeader.i)
      let i+=1
    endwhile
    let fname = g:TagLeader.i
    let tagLines = split(tag[1:-2],"\n")
    call writefile(tagLines,fname)
    let fname = substitute(fname,"/",'\\\\/','g')
    execute expand("s/".tag."/".fname."<")
  elseif tag[-1:-1] == '>'
    " existing tag to be closed
    let div = stridx(tag,'<')
    let fname = tag[:div-1]
    let ftext = tag[div+1:-2]
    if (stridx(fname,'/') > -1) && (!isdirectory(split(fname,'/')[0]))
      " tag is a non-existing subfolder
        silent execute expand("!mkdir ".split(fname,'/')[0])
    endif
    call writefile(split(ftext,"\n"),fname)
    let tag = join(split(tag,'\n'),'\\n')

    let tag = substitute(tag,"/",'\\\\/','g')
    let fname = substitute(fname,"/",'\\\\/','g')

    execute expand("s/".tag."/".fname[:-1]."<")
  elseif tag[-1:-1] == '<'
    " open a closed tag
    let fname = tag[:-2]
    let text  = join(readfile(fname),"\r")
    let tag = substitute(tag,"/",'\\\\/','g')
    let text = substitute(text,"/",'\\\\/','g')
    execute expand("s/".tag."/".tag.text.">")
  else
    echo "tag format [< xy >]"
  endif
  normal f[
endf

nmap <S-Enter> :call Visiweg()<CR>

" Changing tag names

let g:TagLeader = "."
command! TagHidden let g:TagLeader = "."
command! TagFolder let g:TagLeader = "tags/"
command! TagNumbers let g:TagLeader = ""

" Help
command! TagHelp :h vi-si-weg
