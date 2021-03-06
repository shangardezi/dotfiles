syntax on

" Leader Mappings
map <Space> <leader>
map <Leader>w :update<CR>
map <Leader>q :qall<CR>
	
if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

" Import denite config
source ~/.denite.vim

if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup
  let g:grep_cmd_opts = '--line-numbers --noheading'

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" if filereadable(expand("~/.vimrc.rspec"))
"   source ~/.vimrc.rspec
" endif

" let g:rspec_runner = "os_x_iterm"
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
let g:NERDTreeWinSize=31
" Prefere *_spec.rb rather than *_test.rb with :A
" let g:rails_projections = {
"       \  'app/*.rb': {
"       \     'alternate': 'spec/{}_spec.rb',
"       \     'type': 'source'
"       \   },
"       \  'spec/*_spec.rb': {
"       \     'alternate': 'app/{}.rb',
"       \     'type': 'test'
"       \   }
"       \}
" enable autocomplete
let g:deoplete#enable_at_startup = 1
"let g:python3_host_prog = 'python3'

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" Gopls
let g:go_def_mode='gopls'
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

"vim-go
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_auto_type_info = 1

" vim-jsx-pretty
let g:vim_jsx_pretty_highlight_close_tag = 1

" Map keys for most used commands.
" Ex: `\b` for building, `\r` for running and `\b` for running test.
autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>t  <Plug>(go-test)

" nnoremap <F6> :w <CR> :GoTestCompile <CR> <CR>
" inoremap <F6> <ESC> :w <CR> :GoTestCompile <CR> <CR>

" coc
" use tab for trigger completion with characters ahead and navigate.
" note: use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <tab>
      \ pumvisible() ? "\<c-n>" :
      \ <sid>check_back_space() ? "\<tab>" :
      \ coc#refresh()
inoremap <expr><s-tab> pumvisible() ? "\<c-p>" : "\<c-h>"
"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" use <cr> to confirm completion, `<c-g>u` means break undo chain at current
" position. coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <cr>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<c-y>" : "\<c-g>u\<cr>"
else
  inoremap <expr> <cr> pumvisible() ? "\<c-y>" : "\<c-g>u\<cr>"
endif

" coc-snippets (:CocInstall coc-snippets)
imap <C-k> <Plug>(coc-snippets-expand)
"
" " Use `[g` and `]g` to navigate diagnostics
" " Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
"
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
"
" " Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
"
let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-yank', 'coc-prettier', 'coc-snippets', 'coc-rls']
"
" " Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" " Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" end coc



"Triger `autoread` when files changes on disk
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
map <silent> <Leader>n :NERDTreeToggle<CR>

" \v to find current file in NERDTree
nnoremap <silent> <Leader>/ :NERDTreeFind<CR>

" remove search highlighting with esc
nnoremap <esc> :noh<return><esc>

" CloseTag

let g:closetag_filenames = '*.html,*.xhtml,*.phtml'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.tsx'
let g:closetag_filetypes = 'html,xhtml,phtml,javascript'
let g:closetag_xhtml_filetypes = 'xhtml,jsx,tsx'

colorscheme railscasts
