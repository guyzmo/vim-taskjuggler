" Vim filetype plugin
" Language:     TaskJuggler
" Maintainer:		Max Meyer <dev@fedux.org>

if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

let s:cpo_save = &cpo
set cpo&vim

unlet! b:did_ftplugin

setlocal comments=:#
setlocal commentstring=#\ %s
setlocal formatoptions-=t formatoptions+=croql

let b:undo_ftplugin = "|setl cms< com< fo<"

function! s:TJMan(command) " {{{
    let command = join(map(split(a:command), 'expand(v:val)'))
    let winnr = bufwinnr('^' . command . '$')
    silent! execute  winnr < 0 ? 'topleft new ' . fnameescape(command) : winnr . 'wincmd w'
    setlocal buftype=nowrite bufhidden=wipe nobuflisted noswapfile nowrap nonumber
    echo 'Loading Manual ' . command . '...'
    silent! execute 'silent %!tj3man '. command .' | tail +10'
    silent! execute 'set syntax=man'
    silent! redraw
    silent! execute 'au BufUnload <buffer> execute bufwinnr(' . bufnr('#') . ') . ''wincmd w'''
    silent! execute 'nnoremap <silent> <buffer> <LocalLeader>K :call <SID>ExecuteInShell(''' . command . ''')<CR>:AnsiEsc<CR>'
    silent! execute 'nnoremap <silent> <buffer> ^] :call <SID>ExecuteInShell(''' . command . ''')<CR>:AnsiEsc<CR>'
    silent! execute 'nnoremap <silent> <buffer> q :q<CR>'
    silent! execute 'nnoremap <silent> <buffer> <ESC> :q<CR>'
    silent! execute 'AnsiEsc'
    echo 'TaskJuggler Manual: ' . command . ' loaded.'
endfunction " }}}
command! -complete=shellcmd -nargs=+ TJMan call s:TJMan(<q-args>)
nnoremap <leader>K :exec 'TJMan '.expand('<cword>')<CR>

" vim:set sw=2:
