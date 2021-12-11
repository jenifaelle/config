func! local#zettel#edit(...)
    " Build the file name
    let s:sep = ''
    if len(a:000) > 0
        let s:sep = '-'
    endif

    let s:fname = expand("~/Nextcloud/Documents/Zettelkasten/") . strftime("%Y%m%d%H%M%S") . s:sep . join(a:000, '-') . '.md'

    exec "edit " . fnameescape(s:fname)

    " Fill header content
    let s:note = []
    let s:header_markup = "#"
    let s:human_date = strftime("%F %H:%M:%S")
    let s:title = ""

    if len(a:000) > 0
        let s:title = join(a:000)
    endif

    call add(s:note, s:header_markup . " " . s:human_date . " " . s:title)

    " Write note header content
    let s:failed = append(0, s:note)

    " Maybe some error management?!
endfunc
