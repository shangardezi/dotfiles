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

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set expandtab

" Easy split movement using CTRL + letter
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

"Ctrl + n to toggle Sidebar
map <§> :NERDTreeToggle<CR>
colorscheme railscasts
