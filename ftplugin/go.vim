
setlocal nolist

" vim-go configurations
"nnoremap gi :silent GoImports<CR>
"nnoremap gd :silent GoDef<CR>
"nnoremap gb :silent GoBuild<CR>
"nnoremap gr :silent GoRun<CR>
"nnoremap gt :silent GoTestFunc<CR>
"nnoremap gv :silent GoVet<CR>

"augroup go
"    autocmd!
"    autocmd BufWritePost *.go silent LspDocumentDiagnostics
"augroup END

let g:asyncomplete_auto_popup = 0
let g:lsp_diagnostics_enabled = 1
set completeopt+=menuone,preview,noselect
inoremap <C-f> <C-x><C-o>

