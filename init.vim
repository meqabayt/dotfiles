" Installation instructions:
"
"   1. Install vim-plug: curl -fLo ~/nvim/autoload/plug.vim --create-dirs \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"   2. :PlugInstall
"   3. :GoInstallBinaries
"
scriptencoding utf-8
set encoding=utf-8

"----------------------------------------------------------------------
" Plugins
"----------------------------------------------------------------------
call plug#begin('~/.nvim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/fzf.vim'
Plug 'fatih/vim-go'
Plug 'gcmt/taboo.vim'
Plug 'mhinz/vim-startify'
Plug 'othree/yajs.vim'
Plug 'plasticboy/vim-markdown'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'vim-scripts/tcd.vim'
Plug 'gruvbox-community/gruvbox'
Plug 'NLKNguyen/papercolor-theme'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'hashivim/vim-terraform'
Plug 'SirVer/ultisnips'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc-yaml'
Plug 'neoclide/coc-json'
Plug 'neoclide/coc-tsserver'
Plug 'neoclide/coc-rls'
Plug 'neoclide/coc-vetur'
Plug 'josa42/coc-sh'
Plug 'josa42/coc-go'
Plug 'iamcco/coc-angular'
Plug 'fannheyward/coc-pyright'
Plug 'neoclide/coc-snippets'
Plug 'neoclide/coc-yaml'
Plug 'fannheyward/coc-sql'
Plug 'cespare/vim-toml'
Plug 'pedrohdz/vim-yaml-folds'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'robertbasic/vim-hugo-helper'
Plug 'wlemuel/vim-tldr'
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
Plug 'mattn/webapi-vim'
Plug 'tpope/vim-dadbod'
Plug 'buoto/gotests-vim'
Plug 'rust-lang/rust.vim'
Plug 'sago35/tinygo.vim'
Plug 'williamboman/nvim-lsp-installer'
Plug 'neovim/nvim-lspconfig'
Plug 'github/copilot.vim'
call plug#end()
"----------------------------------------------------------------------
" Basic Options
"----------------------------------------------------------------------
let mapleader=";"         " The <leader> key
set autoread              " Reload files that have not been modified
set backspace=2           " Makes backspace not behave all retarded-like
set colorcolumn=80        " Highlight 80 character limit
set hidden                " Allow buffers to be backgrounded without being saved
set laststatus=2          " Always show the status bar
set list                  " Show invisible characters
set listchars=tab:›\ ,eol:¬,trail:⋅ "Set the characters for the invisibles
set number
set ruler                 " Show the line number and column in the status bar
set t_Co=256              " Use 256 colors
set scrolloff=999         " Keep the cursor centered in the screen
set showmatch             " Highlight matching braces
set showmode              " Show the current mode on the open buffer
set splitbelow            " Splits show up below by default
set splitright            " Splits go to the right by default
set title                 " Set the title for gvim
set visualbell            " Use a visual bell to notify us
set noswapfile            " Do not create swap files
set mouse=a               " Enable mouse
" Customize session options. Namely, I don't want to save hidden and
" unloaded buffers or empty windows.
set sessionoptions="curdir,folds,help,options,tabpages,winsize"

if !has("win32")
    set showbreak=↪           " The character to put to show a line has been wrapped
end

syntax on                 " Enable filetype detection by syntax

" Home path
if has("nvim")
    " Neovim
    let g:vim_home_path = "~/nvim"
elseif has("win32")
    " We're on Windows.
    let g:vim_home_path = "~/vimfiles"
else
    " We're on some POSIX system, hopefully.
    let g:vim_home_path = "~/.vim"
endif

" Backup settings
" set backup
" set writebackup
" set undofile

" Search settings
set hlsearch   " Highlight results
set ignorecase " Ignore casing of searches
set incsearch  " Start showing results as you type
set smartcase  " Be smart about case sensitivity when searching
nnoremap fw * ':%s/'.expand('<cword>').'//gn<CR>``'

" Tab settings
set expandtab     " Expand tabs to the proper type and size
set tabstop=4     " Tabs width in spaces
set softtabstop=4 " Soft tab width in spaces
set shiftwidth=4  " Amount of spaces when shifting

" Tab completion settings
set wildmode=list:longest     " Wildcard matches show a list, matching the longest first
set wildignore+=.git,.hg,.svn " Ignore version control repos
set wildignore+=*.6           " Ignore Go compiled files
set wildignore+=*.pyc         " Ignore Python compiled files
set wildignore+=*.rbc         " Ignore Rubinius compiled files
set wildignore+=*.swp         " Ignore vim backups

" GUI settings
if has("gui_running") || has("nvim")
    colorscheme gruvbox
    " colorscheme PaperColor
    set guioptions=cegmt

    if has("win32")
        set guifont=Inconsolata:h11
    else
        set guifont=Inconsolata\ for\ Powerline:h14
    endif

    if exists("&fuopt")
        set fuopt+=maxhorz
    endif
endif

"----------------------------------------------------------------------
" Key Mappings
"----------------------------------------------------------------------
" Remap a key sequence in insert mode to kick me out to normal
" mode. This makes it so this key sequence can never be typed
" again in insert mode, so it has to be unique.
inoremap jj <esc>
inoremap jJ <esc>
inoremap Jj <esc>
inoremap JJ <esc>
inoremap jk <esc>
inoremap jK <esc>
inoremap Jk <esc>
inoremap JK <esc>

" Make j/k visual down and up instead of whole lines. This makes word
" wrapping a lot more pleasent.
map j gj
map k gk

" cd to the directory containing the file in the buffer. Both the local
" and global flavors.
nmap <leader>cd :cd %:h<CR>
nmap <leader>lcd :lcd %:h<CR>

" Shortcut to edit the vimrc
if has("nvim")
    nmap <silent> <leader>vimrc :e ~/nvim/init.vim<CR>
else
    nmap <silent> <leader>vimrc :e ~/.vimrc<CR>
endif

" Split
nnoremap <C-s>s :sp<CR>
nnoremap <C-s>w :vs<CR>

"" Make navigating around splits easier
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
if has('nvim')
  " We have to do this to fix a bug with Neovim on OS X where C-h
  " is sent as backspace for some reason.
  nnoremap <BS> <C-W>h
endif

" Make resizing of splitted windows easier
nnoremap <silent> <C-S-Right> :vertical resize -1<CR>
nnoremap <silent> <C-S-Left> :vertical resize +1<CR>
nnoremap <silent> <C-S-Up> :resize +1<CR>
nnoremap <silent> <C-S-Down> :resize -1<CR>

" Navigating tabs easier
map <D-S-{> :tabprevious
map <D-S-}> :tabprevious

" Shortcut to yanking to the system clipboard
map <leader>y "+y
map <leader>d "+d
map <leader>p "+p


" Get rid of search highlights
noremap <silent><leader>/ :nohlsearch<cr>
" Get rid of same id highlights
autocmd FileType go noremap <silent><leader>/ :GoSameIdsClear<cr>

" Command to write as root if we dont' have permission
cmap w!! %!sudo tee > /dev/null %

" Expand in command mode to the path of the currently open file
cnoremap %% <C-R>=expand('%:h').'/'<CR>

" Buffer management
nnoremap <leader>d   :bd<cr>

" Go
let g:go_list_type = "quickfix"    " error lists are of type quickfix
let g:go_fmt_command = "goimports" " automatically format and rewrite imports
let g:go_auto_sameids = 1          " highlight matching identifiers
let g:go_def_mapping_enabled = 0   " coc.vim will do `gd`
let g:go_test_timeout = "30s"      " increase test timeout from 10s to 30s
let g:go_doc_popup_window = 1
let g:go_highlight_function_calls = 1
let g:go_auto_type_info = 1
let g:go_metalinter_autosave = 1

autocmd FileType go nnoremap <silent> <Leader>gd :GoDeclsDir<CR>

"" Go debug
autocmd FileType go noremap <silent> <Leader>db :GoDebugBreakpoint<CR>
autocmd FileType go noremap <silent> <Leader>dc :GoDebugContinue<CR>
autocmd FileType go noremap <silent> <Leader>dn :GoDebugNext<CR>
autocmd FileType go noremap <silent> <Leader>ds :GoDebugStep<CR>
autocmd FileType go noremap <silent> <Leader>dso :GoDebugStepOut<CR>

" Rust
let g:rustfmt_autosave = 1
let g:rust_clip_command = 'xclip -selection clipboard'

" CoC
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> rn <Plug>(coc-rename)

nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" Terminal mode
if has("nvim")
    tnoremap <esc> <C-\><C-n>
    tnoremap jj <C-\><C-n>
    tnoremap jJ <C-\><C-n>
    tnoremap Jj <C-\><C-n>
    tnoremap JJ <C-\><C-n>
    tnoremap jk <C-\><C-n>
    tnoremap jK <C-\><C-n>
    tnoremap Jk <C-\><C-n>
    tnoremap JK <C-\><C-n>
    nnoremap <Leader>c :terminal <CR>
endif

" Tabs
map <C-t> :tabnew<CR>
map <C-c> :tabclose<CR>
map <C-[> :tabprevious<CR>
map <C-]> :tabnext<CR>

" CtrlP
nnoremap <leader>l :CtrlPLine<cr>

"----------------------------------------------------------------------
" Autocommands
"----------------------------------------------------------------------
" Clear whitespace at the end of lines automatically
autocmd BufWritePre * if index(['markdown'], &ft) < 0 | :%s/\s\+$//e

" Don't fold anything.
autocmd BufWinEnter * set foldlevel=999999
autocmd FileType go set foldmethod=syntax
autocmd FileType yaml set foldmethod=syntax
autocmd FileType json set foldmethod=syntax

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Reload Powerline when we read a Puppet file. This works around
" some weird bogus bug.
autocmd BufNewFile,BufRead *.pp call Pl#Load()

"----------------------------------------------------------------------
" Plugin settings
"----------------------------------------------------------------------
" CtrlP
let g:ctrlp_max_files = 10000
if has("unix")
    let g:ctrlp_user_command = {
        \ 'types': {
            \ 1: ['.git', 'cd %s && git ls-files . -co --exclude-standard'],
            \ 2: ['.hg', 'hg --cwd %s locate -I .'],
        \ },
        \ 'fallback': 'find %s -type f | head -' . g:ctrlp_max_files
    \ }
endif

let g:ctrlp_buffer_func = { 'enter': 'MyCtrlPMappings' }
let g:ctrlp_custom_ignore = 'node_modules\|.git\|.venv\|vendor'

func! MyCtrlPMappings()
    nnoremap <buffer> <silent> <c-@> :call <sid>DeleteBuffer()<cr>
endfunc

func! s:DeleteBuffer()
  let line = getline('.')
  let bufid = line =~ '\[\d\+\*No Name\]$' ? str2nr(matchstr(line, '\d\+'))
        \ : fnamemodify(line[2:], ':p')
  exec "bd" bufid
  exec "norm \<F5>"
endfunc<D-j>

" JSON
let g:vim_json_syntax_conceal = 0
autocmd BufWritePre *.json :%!jq '.'
autocmd BufWritePre *.sh :%!shfmt -i 2

" Startify
let g:startify_list_order = ['files', 'dir', 'sessions']

" NERDTree settings
" autocmd vimenter * NERDTree
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
nnoremap <C-n> :NERDTreeToggle<cr>
let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "*",
    \ "Staged"    : "+",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }
let g:NERDTreeGitStatusShowIgnored = 1
let g:NERDTreeGitStatusConcealBrackets = 1

" Terraform settings
let g:terraform_align=1
let g:terraform_fmt_on_save=1

" Syntastic
let g:syntastic_python_checker="pyflakes"
let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'active_filetypes': [],
                           \ 'passive_filetypes': ['cpp', 'go', 'puppet'] }

" Ultisnips
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-k>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsSnippetDirectories=["UltiSnips", "gosnippets"]

" FZF
nnoremap <silent> <Leader>f :Rg<CR>
nnoremap <silent> <Leader>g :Commits<CR>
nnoremap <silent> <Leader>b :Buffers<CR>

" NERDCommenter
let g:NERDCreateDefaultMappings = 1
let g:NERDSpaceDelims = 1

" Hugo
let g:hugohelper_spell_check_lang = 'en_us'
autocmd BufEnter *.md,*.adoc :HugoHelperSpellCheck

" Vue
let g:LanguageClient_serverCommands = {
    \ 'vue': ['vls']
    \ }

" SQL
" format sql code on save
autocmd BufWritePre *.sql :CocCommand sql.Format

" SQL querier
let g:dbvar = 'g:local_db' " variable where connection url is stored
let g:local_db = 'postgresql://postgres:postgres@localhost:5432/postgres' " connection url
let g:dev_db = 'postgresql://postgres:postgres@localhost:5432/dev'

"" form query like :DB dblink request
function FormDBSQL(dblink, register)
    let reg_val = getreg(a:register)
    let formed_command = ':DB ' . a:dblink . ' ' . reg_val
    return formed_command
endfunction

"" map selected sql to be executed
xmap <silent> <Leader>e y :execute FormDBSQL(g:dbvar, '"')<CR>

"" Easier navigation on result
nmap <C-PageUp> F\|F\|2l
nmap <C-PageDown> f\|2l

nmap <leader>cp :Copilot panel<CR>

