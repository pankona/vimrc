if &compatible
  set nocompatible
endif

set encoding=utf-8
scriptencoding utf-8

set rtp+=~/.cache/dein/repos/github.com/Shougo/dein.vim

call dein#begin('~/.cache/dein')

call dein#add('Shougo/dein.vim')
call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
call dein#add('haya14busa/dein-command.vim')
call dein#add('junegunn/fzf', { 'build': './install --all', 'merged': 0 })
call dein#add('junegunn/fzf.vim', { 'depends': 'fzf' })
call dein#add('w0ng/vim-hybrid')
call dein#add('scrooloose/nerdtree')
call dein#add('dense-analysis/ale')
call dein#add('prabirshrestha/vim-lsp')
call dein#add('prabirshrestha/async.vim')
call dein#add('prabirshrestha/asyncomplete.vim')
call dein#add('prabirshrestha/asyncomplete-lsp.vim')
call dein#add('vim-ruby/vim-ruby')
call dein#add('tpope/vim-rails')
call dein#add('slim-template/vim-slim')
call dein#add('ElmCast/elm-vim')
call dein#add('thinca/vim-quickrun')
call dein#add('kchmck/vim-coffee-script')
call dein#add('leafgarland/typescript-vim')
call dein#add('prettier/vim-prettier', {
            \ 'do': 'yarn install',
            \ 'for': ['javascript', 'typescript', 'typescriptreact', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html']})
call dein#add('mattn/vim-lsp-settings')
call dein#add('mattn/vim-goimports')
call dein#add('junkblocker/patchreview-vim')
call dein#add('codegram/vim-codereview')
call dein#add('elixir-editors/vim-elixir')
call dein#add('jparise/vim-graphql')
call dein#add('tokorom/vim-review')
call dein#add('vim-denops/denops.vim')
call dein#add('lambdalisue/gin.vim')
call dein#add('github/copilot.vim')
call dein#add('hashivim/vim-terraform')

call dein#end()

filetype plugin indent on
syntax enable

if dein#check_install()
  call dein#install()
endif

set hidden
set spell
set spelllang=en,cjk
set list
set listchars=tab:»-
set autoindent
set backspace=indent,eol,start
set expandtab
set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis,ucs-bom,default,latin1
set fileformats=unix,dos,mac
set helplang=ja
set hlsearch
set ignorecase
set incsearch
set langmenu=none
set modelines=0
set shiftwidth=4
set smartcase
set smartindent
set softtabstop=4
set suffixes=.bak,~,.o,.h,.info,.swp,.obj,.class
set tabstop=4
set termencoding=utf-8
set window=0
set number
set scrolloff=7
set ambiwidth=single " double だと claude code の見た目がおかしくなるので single にする
set directory=~/.vim/tmp
set ruler
set background=dark
set laststatus=2
set t_Co=256
set mmp=500000
set signcolumn=yes
set autoread
set visualbell t_vb=
set clipboard+=unnamed
set noswapfile
set splitright
set shell=bash

" disable ale by default
let g:ale_enabled = 0

augroup vimrc-checktime
  autocmd!
  autocmd WinEnter * checktime
augroup END

autocmd ColorScheme * highlight LineNr ctermfg=245
colorscheme hybrid

" for background transparency
hi Normal ctermbg=none

augroup Vim
    autocmd!
    autocmd QuickfixCmdPost *grep* cwindow
augroup END

cabbrev grep Ag
cabbrev ag Ag
cabbrev lca LspCodeAction
cabbrev gl GinLog ++opener=vsplit -p -- %:p

nnoremap : ;
nnoremap ; :
nnoremap <silent><Esc><Esc> :nohlsearch<CR>
nnoremap <C-n> :cnext<CR>
nnoremap <C-p> :cprevious<CR>
nnoremap <silent> sd :NERDTreeToggle<CR>  
nnoremap <silent> sf :NERDTreeFind<CR>  

let g:mapleader=","

" fzf key maps
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fb :Buffers<CR>

" copy fullpath of a file on current buffer
nnoremap <leader>cf :let @*=expand("%:p")<CR>

nnoremap <leader>t :vertical terminal<CR>

let g:lsp_settings_servers_dir = expand("~/.lsp_server")

set omnifunc=lsp#complete

let g:asyncomplete_auto_popup = 1
let g:asyncomplete_popup_delay = 1000
let g:asyncomplete_auto_completeopt = 1
set completeopt+=menuone,preview,noselect
let g:lsp_diagnostics_enabled = 1
" let g:lsp_insert_text_enabled = 0
let g:lsp_signs_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_diagnostics_float_cursor = 1
let g:lsp_signature_help_enabled = 1
" let g:lsp_use_event_queue = 0
" let g:lsp_diagnostics_signs_enabled = 0
let g:lsp_document_code_action_signs_enabled = 0

nnoremap <leader>dd :LspDocumentDiagnostics<CR>
nnoremap gd :LspDefinition<CR>
nnoremap gh :LspHover<CR>
nnoremap gi :LspCodeActionSync source.organizeImports<CR>
nnoremap gn :LspNextDiagnostic<CR>
nnoremap gp :LspPreviousDiagnostic<CR>
inoremap <C-f> <C-x><C-o>

nnoremap <leader>pa "+p
vnoremap <leader>pa d"+p
cnoremap <leader>pa <C-r>+

" claude code にビジュアルブロックで指定した場所のファイルパスと行数を渡すためのコマンド
vnoremap <leader>y :<C-u>let @" = '@' . expand('%') . ':L' . line("'<") . '-L' . line("'>")<CR>

inoremap <expr> <ESC><ESC> pumvisible() ? "\<C-y>\<ESC>" : "\<ESC>"
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"
inoremap <expr> <C-y> pumvisible() ? asyncomplete#close_popup() : "\<C-y>"
inoremap <expr> <C-e> pumvisible() ? asyncomplete#cancel_popup() : "\<C-e>"

" make prettier default configuration  since vim-prettier doesn't follow
" prettier's default configuration
let g:prettier#config#print_width = 'auto'
let g:prettier#config#tab_width = 'auto'
let g:prettier#config#use_tabs = 'auto'
let g:prettier#config#parser = ''
let g:prettier#config#config_precedence = 'file-override'
let g:prettier#config#prose_wrap = 'preserve'
let g:prettier#config#html_whitespace_sensitivity = 'css'
let g:prettier#config#require_pragma = 'false'
let g:prettier#config#arrow_parens = 'always'


"" ノーマルモード時に非点滅のブロックタイプのカーソル
let &t_EI .= "\e[2 q"

let g:copilot_filetypes = {
  \ 'gitcommit': v:true,
  \ 'markdown': v:true,
  \ 'yaml': v:true
  \ }
