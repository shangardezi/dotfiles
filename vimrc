syntax on

" Leader Mappings
map <Space> <leader>
map <Leader>w :update<CR>
map <Leader>q :qall<CR>
	
if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup
  let g:grep_cmd_opts = '--line-numbers --noheading'

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

if filereadable(expand("~/.vimrc.rspec"))
  source ~/.vimrc.rspec
endif

let g:rspec_runner = "os_x_iterm"
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
let g:NERDTreeWinSize=30
" Prefere *_spec.rb rather than *_test.rb with :A
let g:rails_projections = {
      \  'app/*.rb': {
      \     'alternate': 'spec/{}_spec.rb',
      \     'type': 'source'
      \   },
      \  'spec/*_spec.rb': {
      \     'alternate': 'app/{}.rb',
      \     'type': 'test'
      \   }
      \}
" enable autocomplete
let g:deoplete#enable_at_startup = 1
"let g:python3_host_prog = 'python3'

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" Gopls
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_fmt_command = 'goimports'


" Set specific linters
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'go': ['gopls'],
\}

" Only run linters named in ale_linters settings.
let g:ale_linters_explicit = 1

" Show linter errors in airline
let g:airline#extensions#ale#enabled = 1

" Disable ALE auto highlights
let g:ale_set_highlights = 0

" Triger `autoread` when files changes on disk
" https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
" https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
" Notification after file change
" https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None


" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set expandtab

" :Lint to run golint
" set rtp+=$GOPATH/src/golang.org/x/lint/misc/vim

" Runs lint on :w
" autocmd BufWritePost,FileWritePost *.go execute 'Lint' | cwindow

" Easy split movement using CTRL + letter
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" CTRL + F for searching all files
nmap <C-f> <Plug>CtrlSFPrompt
vmap <C-F>F <Plug>CtrlSFVwordExec

" // to search for highlited word in the document
vnoremap // y/<C-R>"<CR>
"
"Ctrl + n to toggle Sidebar
map <F7> :NERDTreeToggle<CR>

" \v to find current file in NERDTree
nnoremap <silent> <Leader>v :NERDTreeFind<CR>

colorscheme railscasts
