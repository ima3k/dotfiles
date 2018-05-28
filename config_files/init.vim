filetype plugin indent on   " automatically finds and load specific plugin

""my settings
syntax on
set t_Co=256
"colorscheme apprentice
set encoding=utf-8
set nocompatible
set backspace=2
set ruler
set showcmd                 " display incomplete commands
set viminfo^=%
set wildmenu
set number
set laststatus=2
set showtabline=0
set hidden
set pastetoggle=<leader>v
set autoread
set hlsearch                " highlight searched text
set incsearch               " do incremental searching
set noswapfile
set ruler                   " show the cursor position all the time
set autoindent
set relativenumber
set smarttab
set mousehide
set title                      " When on, the title of the window will be set to the value of 'titlestring'.
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:▸
set smartindent              " automatically inserts one extra level of
set wrap                       " Wrap lines longer than the windows width.
set spelllang=en_us
set cursorline                 " Highlight the screen line of the cursor with CursorLine.
set expandtab               " replace tabs with spaces
set tabstop=2               " how many columns a tab counts for
set shiftwidth=2           " control how many columns text is indented with
"set backspace=indent,eol,start " Allow proper backspacing over special symbols.
set colorcolumn=120
set noshowmode
set clipboard=unnamedplus
set termguicolors
set splitbelow                 " Open new split panes to bottom, instead top
set splitright                 " Open new split panes to right, instead of left
set ttyfast " assume fast terminal connectio
set autoread "auto reload if file saved externally
set foldenable          " enable folding
set foldmethod=indent   " fold based on indent level

let mapleader=','
set path+=**

let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/opt/python/x86_64/3.6.0-1/bin/python'

let g:deoplete#enable_at_startup = 1

call plug#begin()
" All of your Plugins must be added before the following line
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'osyo-manga/unite-quickfix'
Plug 'jrosiek/vim-mark'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'itchyny/lightline.vim'
Plug 'Shougo/unite.vim'
Plug 'easymotion/vim-easymotion'
Plug 'Shougo/vimfiler.vim'
Plug 'hewes/unite-gtags'
Plug 'Shougo/neomru.vim'
Plug 'yuttie/comfortable-motion.vim'
Plug 'kristijanhusak/vim-hybrid-material' "colorscheme
Plug 'sgur/unite-qf' " unite quickfix
Plug 'yggdroot/indentline'
Plug 'justincampbell/vim-eighties'
Plug 'kshenoy/vim-signature'
Plug 'airblade/vim-gitgutter'
Plug 'machakann/vim-highlightedyank'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'osyo-manga/vim-brightest'  " highlight word under csursor

"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'tenfyzhong/CompleteParameter.vim'
Plug 'maximbaz/lightline-ale'
"Plug 'lyuts/vim-rtags'
"Plug 'rzaluska/deoplete-rtags'

Plug 'w0rp/ale'
call plug#end()            " required

nmap s <Plug>(easymotion-overwin-f2)

noremap ; l
noremap l k
noremap k j
noremap j h

nnoremap l gk
nnoremap gk l
nnoremap k gj
nnoremap gj k

cmap <C-p> <Up>
cmap <C-n> <Down>

nmap <leader>so :so $MYVIMRC<cr>
map vv <Esc>:tabe $MYVIMRC<CR>

map <leader>h :AV <CR>
map <leader>c :noh <CR>
map <leader>q :q <CR>
map <leader>v :Lexplore %:h<CR>
nnoremap <tab> %
vnoremap <tab> %
map <leader>o :echo expand("%:p") <CR>
map <C-p> :Files .<cr>

map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

set background=dark


let g:indentLine_char = '┆'
let g:indentLine_enabled = 1

colorscheme hybrid_reverse

let g:lightline = {
      \ 'colorscheme': 'one',
      \ }

"map <leader>j `
"Unite
noremap <leader>f <esc>:Unite -no-split buffer file_mru  <CR>
noremap <leader>t <esc>:Unite -no-split gtags/context<CR>
noremap <leader>d <esc>:Unite -no-split gtags/def<CR>
noremap <leader>gr <esc>:Unite -no-split gtags/ref<CR>
nnoremap <C-y> :Unite history/yank<CR>
autocmd FileType unite call s:unite_settings()

function! s:unite_settings()
  imap <buffer> <C-k> <Plug>(unite_select_next_line)
  imap <buffer> <C-l> <Plug>(unite_select_previous_line)

  nmap <silent><buffer><expr> Enter unite#do_action('switch')
  nmap <silent><buffer><expr> <C-t> unite#do_action('tabswitch')
  nmap <silent><buffer><expr> <C-h> unite#do_action('splitswitch')
  nmap <silent><buffer><expr> <C-v> unite#do_action('vsplitswitch')

  imap <silent><buffer><expr> Enter unite#do_action('switch')
  imap <silent><buffer><expr> <C-t> unite#do_action('tabswitch')
  imap <silent><buffer><expr> <C-h> unite#do_action('splitswitch')
  imap <silent><buffer><expr> <C-v> unite#do_action('vsplitswitch')

  map <buffer> <C-p> <Plug>(unite_toggle_auto_preview)

 nnoremap <ESC> :UniteClose<cr>
endfunction

command! -nargs=* -complete=dir Cd call fzf#run(fzf#wrap(
  \ {'source': 'find '.(empty(<f-args>) ? '.' : <f-args>).' -type d',
  \  'sink': 'cd'}))

"plugins mapping
nnoremap <leader>ur :UniteResume<cr>
nnoremap <leader>uo :Unite -no-split outline<cr>
nnoremap <leader>gg :Unite -no-split grep:.::<c-r><c-w><cr>

"Arrow keys
noremap <left> <nop>
noremap <right> <nop>
noremap <up> <nop>
noremap <down> <nop>

inoremap <left> <nop>
inoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>

nmap <c-j> <c-w><c-h>
nmap <c-l> <c-w><c-l>

inoremap ;; <c-o>$;<ESC>

let g:eighties_enabled = 1
let g:eighties_minimum_width = 120
let g:eighties_extra_width = 0 " Increase this if you want some extra room
let g:eighties_compute = 1 " Disable this if you just want the minimum + extra
let g:eighties_bufname_additional_patterns = ['fugitiveblame'] " Defaults to [], 'fugitiveblame' is only an example. Takes a comma delimited list of bufnames as strings.
"

inoremap <silent><expr> ( complete_parameter#pre_complete("()")
smap <c-k> <Plug>(complete_parameter#goto_next_parameter)
imap <c-k> <Plug>(complete_parameter#goto_next_parameter)
smap <c-j> <Plug>(complete_parameter#goto_previous_parameter)
imap <c-j> <Plug>(complete_parameter#goto_previous_parameter)

"ale configuration
let g:ale_lint_on_enter = 0
let g:markify_error_text = '✗'
let g:markify_warning_text = '⚠'
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '##'

let g:ale_linters = {
      \   'cpp': ['clangcheck'],
      \}

let g:ale_lint_on_text_changed = 'never'
let g:ale_cpp_clangcheck_executable = '/opt/llvm/x86_64/3.8.0/bin/clang-check'
let g:ale_cpp_clangcheck_options=''


let g:lightline.component_expand = {
      \  'linter_checking': 'lightline#ale#checking',
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \ }

let g:lightline.component_type = {
      \     'linter_checking': 'warning',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \     'linter_ok': 'left',
      \ }
let g:lightline.active = { 'right': [[ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ]] }

let g:ale_c_build_dir='$REPO_DIR'

autocmd BufEnter *.cpp,*.hpp,*.c,*.h let g:filePathForAle = expand('%:p')
map <C-\> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

" highlight ExtraWhitespace at end of line, remove them at save buffer ######################
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

