
function s:mdfmt()
    let l:curw = winsaveview()
    silent! exe "normal! a \<bs>\<esc>" | undojoin |
                \ exe "normal gggqG"
    call winrestview(l:curw)
endfunction

setlocal formatprg=prettier\ --parser\ markdown

nnoremap <leader>fm :call <SID>mdfmt()<CR>
