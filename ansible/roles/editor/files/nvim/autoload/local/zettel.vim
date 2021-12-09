func! local#zettel#edit(...)
    " build the file name
    let l:sep = ''
    if len(a:000) > 0
        let l:sep = '-'
    endif

    let l:fname = expand("~/Nextcloud/Documents/Zettelkasten/") . strftime("%Y%m%d%H%M) . l:sesp . join(a:000, '-') . '.md'

    exec "e " . l:fname

    if len(a:000) > 0
        exec "normal gg0\<c-r>=strftime('%F %H:%M')\<cr> " . join(a:000) . "\<cr>\<esc>G"
    else
        exec "normal gg0\<c-r>=strftime('%F %H:%M')\<cr>\<cr>\<esc>G"
    endif
endfunc
