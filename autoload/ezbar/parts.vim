let s:parts = {}

function! s:parts.use(name, ...) "{{{1
  " Usage:
  " use('default', {'parts': ['part1,'part2'], 'prefix': ''})
  let parts = ezbar#parts#{a:name}#new()
  if empty(a:000)
    return parts
  endif

  let spec = a:1
  let parts_list = get(spec, 'parts', keys(parts))
  let prefix     = get(spec, 'prefix', '')

  let R = {}
  for part in parts_list
    let R[prefix . part] = parts[part]
  endfor
  return R
endfunction

function! s:parts.list(name) "{{{1
  return keys(ezbar#parts#{a:name}#new())
endfunction
"}}}

" API:
function! ezbar#parts#use(...) "{{{1
  return call(s:parts.use, a:000, s:parts)
endfunction

function! ezbar#parts#list(name) "{{{1
  return s:parts.list(a:name)
endfunction
"}}}
" vim: foldmethod=marker
