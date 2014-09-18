let s:save_cpo = &cpo
set cpo&vim

let s:S = lexima#vital().S

let s:stack = {
\ "v": []
\ }

function! lexima#charstack#new()
  return deepcopy(s:stack)
endfunction

function! s:stack.push(str)
  let xs = split(a:str, '.\zs')
  call extend(self.v, xs, 0)
endfunction

function! s:stack.pop(n)
  return join(remove(self.v, 0, a:n-1), '')
endfunction

function! s:stack.peek(...)
  let n = a:0 >=# 1 ? a:1 : 1
  return join(self.v[0:n-1], '')
endfunction

function! s:stack.pop_all()
  return self.pop(len(self.v))
endfunction

function! s:stack.is_empty()
  return empty(self.v)
endfunction

function! s:stack.count()
  return len(self.v)
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
