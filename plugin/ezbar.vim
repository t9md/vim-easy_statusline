" GUARD:
if expand("%:p") !=# expand("<sfile>:p")
  unlet! g:loaded_ezbar
endif
if exists('g:loaded_ezbar')
  finish
endif
let g:loaded_ezbar = 1
let s:old_cpo = &cpo
set cpo&vim

" Main:
let s:options = {
      \ 'g:ezbar' : {},
      \ }

function! s:set_options(options) "{{{
  for [varname, value] in items(a:options)
    if !exists(varname)
      let {varname} = value
    endif
    unlet value
  endfor
endfunction "}}}
call s:set_options(s:options)

" AutoCmd:
if !empty(g:ezbar)
  augroup plugin-ezbar
    autocmd!
    autocmd WinEnter,BufWinEnter,FileType,ColorScheme * call ezbar#set()
    autocmd ColorScheme,SessionLoadPost * call ezbar#hl_refresh()
  augroup END
endif

" Command:
command! EzBarUpdate  call ezbar#update()
command! EzBarSet     call ezbar#set()
command! EzBarDisable call ezbar#disable()
" command! -range EzBarColorPreview :call ezbar#hl_preview(<line1>, <line2>)

" Finish:
let &cpo = s:old_cpo
" vim: foldmethod=marker
