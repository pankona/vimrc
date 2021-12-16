
"if executable('solargraph')
"    au User lsp_setup call lsp#register_server({
"        \ 'name': 'solargraph',
"        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'solargraph stdio']},
"        \ 'initialization_options': {"diagnostics": "false"},
"        \ 'whitelist': ['ruby'],
"        \ })
"endif

let g:lsp_use_event_queue = 0

command! -nargs=0 ExecuteCurrentLine :execute getline('.')

let g:quickrun_config = {}
let g:quickrun_config['ruby/monorepo'] = {
      \ 'command': 'doo',
      \ 'runner': 'concurrent_process',
      \ 'cmdopt': printf('-f ruby -e "loop do print \">>> \"; STDOUT.flush; x = gets; puts x; system x; end"'),
      \ 'runner/concurrent_process/load': 'bundle exec bin/rspec --no-color "%S:."',
      \ 'runner/concurrent_process/prompt': '>>> '}

nnoremap <leader>m :<C-u>write<Cr>:execute printf("QuickRun -exec 'time doo -f env bundle exec rspec %s:%d'", expand('%s'), getpos('.')[1])<Cr>
nnoremap <leader>M :<C-u>write<Cr>:execute printf("QuickRun -exec 'time doo -f env bundle exec rspec %s'", expand('%s'))<Cr>
nnoremap <S-space>M :<C-u>write<Cr>:execute printf("QuickRun -exec 'time doo -f env bundle exec rspec %s'", expand('%s'))<Cr>
nnoremap <space>m :<C-u>write<Cr>:execute printf("QuickRun -type ruby/monorepo -runner/concurrent_process/load 'bundle exec bin/rspec --no-color \"%s:%d\"'", expand('%:p:.'), getpos('.')[1])<Cr>
nnoremap <space>M :<C-u>write<Cr>:QuickRun -type ruby/monorepo<Cr>


let g:ale_enabled = 1
let g:ale_linters = {
\   'ruby': ['rubocop'],
\}
let g:ale_linters_explicit = 1
let g:airline#extensions#ale#enabled = 1
