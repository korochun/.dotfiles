if &compatible
  set nocompatible
endif

set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  " Eye candy
  call dein#add('gruvbox-community/gruvbox')
  call dein#add('vim-airline/vim-airline')
  call dein#add('ryanoasis/vim-devicons')
  " call dein#add('wsdjeg/dein-ui.vim')
  call dein#add('preservim/nerdtree')
  call dein#add('Xuyuanp/nerdtree-git-plugin')

  " Analysis
  call dein#add('neoclide/coc.nvim', {'merged':0, 'rev': 'release'})
  call dein#add('dense-analysis/ale')
  call dein#add('vim-vdebug/vdebug')
  call dein#add('sbdchd/neoformat')

  " Languages
  call dein#add('rust-lang/rust.vim')
  call dein#add('tpope/vim-markdown')
  call dein#add('iamcco/markdown-preview.nvim', {'on_ft': ['markdown', 'pandoc.markdown', 'rmd'], 'build': 'sh -c "cd app && yarn install"' })
  call dein#add('cespare/vim-toml')

  " Misc
  call dein#add('mbbill/undotree')

  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
end

" CoC plugins
let g:coc_global_extensions = [
  \ 'coc-python',
  \ 'coc-rust-analyzer',
  \ 'coc-snippets',
  \ 'coc-cord',
  \ 'coc-pairs',
  \ 'coc-git',
  \ 'coc-clangd',
  \ 'coc-cmake',
  \ 'coc-css',
  \ 'coc-highlight',
  \ 'coc-markdownlint',
  \ 'coc-sh',
  \ 'coc-translator',
  \ 'coc-vimlsp',
  \ 'coc-explorer',
  \ 'coc-emmet'
\ ]

" Options
set clipboard=unnamedplus
set mouse=a
set wrap
set linebreak
set textwidth=80
set cursorline
set list
set listchars=eol:↵,trail:·,tab:<-,nbsp:·,space:·
set number
set exrc
set secure
set undofile
set smartcase
set expandtab
set tabstop=4
set shiftwidth=4
set switchbuf=useopen,usetab,newtab

" let's
let g:gruvbox_italic=1
let g:gruvbox_italicize_strings=1
let g:gruvbox_improved_warnings=1

let g:airline_theme='gruvbox'
let g:airline_powerline_fonts = 1
let g:airline#extensions#keymap#enabled = 0
let g:airline_left_sep = "\ue0b0"
let g:airline_left_alt_sep = "\ue0b1"
let g:airline_right_sep = "\ue0b2"
let g:airline_right_alt_sep = "\ue0b3"
let g:airline_skip_empty_sections = 1
let g:Powerline_symbols='unicode'

let g:ale_sign_error = "\uf46e"
let g:ale_sign_warning = "\uf071"
let g:ale_disable_lsp = 1

let g:asmsyntax = 'nasm'
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'rust', 'cpp']
let g:mkdp_auto_start = 1

let g:NERDTreeChDirMode = 2
let g:NERDTreeMinimalUI = 1
let g:NERDTreeAutoDeleteBuffer = 1

nnoremap <C-T> :tabnew<CR>:NERDTree<CR>
nnoremap <C-X> :q<CR>
nnoremap <C-S> :w<CR>
nnoremap <C-O> :e 
nnoremap <C-V> :pu!<CR>
nnoremap <C-Z> :u<CR>
nnoremap <C-Q> :conf qa<CR>
nnoremap <C-N> :rightbelow vne<CR>
nnoremap ? :help 

" Autocommands
augroup vimrc
  autocmd! BufWritePost $MYVIMRC source % | echom "Reloaded " . $MYVIMRC | redraw
  autocmd! BufWritePost $MYGVIMRC if has('gui_running') | so % | echom "Reloaded " . $MYGVIMRC | endif | redraw
augroup END

augroup fmt
  autocmd!
  au BufWritePre * try | undojoin | Neoformat | catch /^Vim\%((\a\+)\)\=:E790/ | finally | silent Neoformat | endtry
augroup END

augroup every
  autocmd!
  au InsertEnter * set norelativenumber
  au InsertLeave * set relativenumber
augroup END

" Misc
colorscheme gruvbox

