if !has('nvim')
    set nocompatible
endif

if has('mac')
    silent exec 'language en_US'
    set spelllang=en_us
endif

set hidden

" install vim-plug
if !exists('g:plug_path')
    if has('nvim')
        let g:plug_path = expand('$HOME/.local/share/nvim/plugged')
    else
        let g:plug_path = expand('$HOME/.vim/plugged')
    endif
endif

if has('nvim')
    let s:vimplug_path = expand('$HOME/.local/share/nvim/site/autoload/plug.vim')
else
    let s:vimplug_path = expand('$HOME/.vim/autoload/plug.vim')
endif

if !filereadable(s:vimplug_path)
    if !executable("curl")
        echoerr "You have to install curl or first install vim-plug yourself!"
        execute "q!"
    endif
    echo "Installing Vim-Plug..."
    echo ""
    silent exec "!\curl -fLo " . s:vimplug_path . " --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
    autocmd VimEnter * PlugInstall --sync
endif

" disable all LSP features in ALE, so ALE doesn't try to provide LSP features already provided by coc.nvim, such as auto-completion.
let g:ale_disable_lsp = 1

" vim-plug ------------------------
" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin(g:plug_path)

"NOTE: Make sure you use single quotes
"  Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
"  Plug 'Shougo/vimproc.vim', { 'do': 'make'}

" Completion
"  if !has('nvim')
"      " deoplete requires these plugins for vim8
"      Plug 'roxma/nvim-yarp'
"      Plug 'roxma/vim-hug-neovim-rpc'
"  endif
"  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"  Plug 'Shougo/neoinclude.vim'
"  "Plug 'Shougo/neosnippet.vim'
"  "Plug 'Shougo/neosnippet-snippets'
"  Plug 'SirVer/ultisnips'
"      \ | Plug 'honza/vim-snippets'
"  Plug 'lervag/vimtex', { 'for': ['tex'] }
"  Plug 'deoplete-plugins/deoplete-jedi', { 'for': ['python'] }
"  "Plug 'tweekmonster/deoplete-clang2', { 'for': ['c', 'cpp', 'objc', 'cmake'] }
"  "Plug 'justmao945/vim-clang', { 'for': ['c', 'cpp', 'objc', 'cmake'] }
"  Plug 'Shougo/deoplete-clangx', { 'for': ['c', 'cpp', 'objc', 'cmake'] }
"  "Plug 'osyo-manga/vim-marching', { 'for': ['cpp'] }
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Edit
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-surround'
Plug 'tomtom/tcomment_vim'

" View
"Plug 'nathanaelkane/vim-indent-guides'
Plug 'itchyny/vim-cursorword'
Plug 'norcalli/nvim-colorizer.lua'

" Formatter
Plug 'kana/vim-operator-user'
    \ | Plug 'rhysd/vim-clang-format', { 'for': ['c', 'cpp', 'objc', 'java'] }
Plug 'godlygeek/tabular'
"Plug 'plasticboy/vim-markdown'

" linter
Plug 'w0rp/ale'
"Plug 'scrooloose/syntastic'

" Colorscheme
Plug 'altercation/vim-colors-solarized'
Plug 'cocopon/colorswatch.vim'
Plug 'cocopon/iceberg.vim'
Plug 'AlessandroYorba/Sierra'
Plug 'arcticicestudio/nord-vim'
Plug 'joshdick/onedark.vim'
Plug 'lifepillar/vim-solarized8'
Plug 'nanotech/jellybeans.vim'
Plug 'vim-scripts/darktango.vim'
Plug 'w0ng/vim-hybrid'
Plug 'rakr/vim-one'
Plug 'sjl/badwolf'
Plug 'vim-scripts/Wombat'
Plug 'whatyouhide/vim-gotham'
Plug 'zaki/zazen'
" 
Plug 'luochen1990/rainbow'
" 
Plug 'itchyny/lightline.vim'

" Search
Plug 'dyng/ctrlsf.vim', { 'on': 'CtrlSF' }
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

" git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" html preview

" install server: npm -g install instant-markdown-d
Plug 'suan/vim-instant-markdown', { 'for': ['markdown'] }
let g:instant_markdown_mathjax = 1

"Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
"let g:instant_markdown_autostart = 1

" Swift
Plug 'keith/swift.vim', { 'for': 'swift' }
"  Plug 'landaire/deoplete-swift', { 'for': 'swift' }

" JavaScript
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'othree/yajs.vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'othree/es.next.syntax.vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'othree/javascript-libraries-syntax.vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'kchmck/vim-coffee-script'
Plug 'maxmellon/vim-jsx-pretty', { 'for': ['javascript', 'javascript.jsx'] }

" TypeScript
Plug 'leafgarland/typescript-vim'

" ctags
Plug 'majutsushi/tagbar'
" Plug 'ludovicchabant/vim-gutentags'

" man
"Plug 'vim-utils/vim-man'
"Plug 'nhooyr/neoman.vim'

" box
Plug 'gyim/vim-boxdraw'

call plug#end()

set exrc
set secure

" auto commands
" make sure that this augroup places before colorscheme setting.
augroup highlightFullwidthSpace
    autocmd!
    autocmd Colorscheme * highlight FullwidthSpace term=underline ctermbg=DarkRed guibg=DarkRed
    autocmd VimEnter,WinEnter * match FullwidthSpace /\%u180E\|\%u2000\|\%u2001\|\%u2002\|\%u2003\|\%u2004\|\%u2005\|\%u2006\|\%u2007\|\%u2008\|\%u2009\|\%u200A\|\%u2028\|\%u2029\|\%u202F\|\%u205F\|\%u3000\|　/
augroup END
augroup rememberCursorPosition
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
augroup END

" base setting
" view

if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif

set background=dark
if has('gui_macvim')
    colorscheme one
else
    "colorscheme solarized8
    colorscheme gotham
endif

set updatetime=300 " default value is 4000(=4s)
set conceallevel=1
set number
set ruler
set laststatus=2
set foldmethod=marker
set showcmd
set wrap
if exists('+breakindent')
    set breakindent
endif
set display=lastline
set splitright
set splitbelow
set pumheight=20
set list
set listchars=tab:>\ ,eol:$
set tabstop=4
set showmatch
set matchtime=1
set nocursorline

if has('nvim')
    "set inccommand=split
    set wildoptions=pum
    set pumblend=20
endif

augroup fileTypeIndent
    autocmd!
    autocmd BufNewFile,BufRead *.py setlocal tabstop=4 softtabstop=4 shiftwidth=4
    autocmd BufNewFile,BufRead *.rb setlocal tabstop=2 softtabstop=2 shiftwidth=2
augroup END
" search
set hlsearch
set incsearch
set ignorecase
set smartcase
set wildignorecase

" quote technique from 'https://stackoverflow.com/a/4257175'
" search word under cursor but not jump next
nnoremap * *``
" not modify jump list by the previous command
nnoremap * :keepjumps normal! mi*`i<CR>

" edit
scriptencoding utf-8
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,ucs-bom,iso-20220jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932,latin1
set fileformats=unix,dos,mac
set shiftwidth=4
set cinoptions+=:0,g0
set hidden
set expandtab
set backspace=2 " equals :set backspace=indent,eol,start
set smartindent
let _curfile=expand("%:r")
if _curfile == 'Makefile'
  set noexpandtab
endif
set smarttab
if has('mac')
    set clipboard+=unnamed
elseif has('unix')
    set clipboard+=unnamedplus
endif
if !has('nvim')
    set ttymouse=xterm2
endif

" swap, backup, 
set nobackup
set swapfile
"augroup swapchoice-readonly
"    autocmd!
"    autocmd SwapExists * let v:swapchoice = 'o'
"augroup END
"':set directory=.' will cause problem.

" keymappting
nnoremap j gj
nnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk
nnoremap <ESC><ESC> :noh<CR>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" python path
if executable('python3')
    let g:python3_host_prog = system('which python3 | tr -d "\r\n"')
endif
if executable('python2')
    let g:python_host_prog = system('which python2 | tr -d "\r\n"')
endif

" custom commands
"  Rename command
command! -nargs=1 -complete=file Rename f <args>|call delete(expand('#'))

" 'Shougo/deoplete' ------------------------
"  let g:deoplete#enable_at_startup = 1
"  "let g:deoplete#omni#input_patterns = {}
"  "let g:deoplete#omni#input_patterns.tex =
"  "            \   '\\(?:'
"  "            \  .   '\w*cite\w*(?:\s*\[[^]]*\]){0,2}\s*{[^}]*'
"  "            \  .  '|\w*ref(?:\s*\{[^}]*|range\s*\{[^,}]*(?:}{)?)'
"  "            \  .  '|hyperref\s*\[[^]]*'
"  "            \  .  '|includegraphics\*?(?:\s*\[[^]]*\]){0,2}\s*\{[^}]*'
"  "            \  .  '|(?:include(?:only)?|input)\s*\{[^}]*'
"  "            \  .')'
"  call deoplete#custom#option({
"              \ 'auto_complete_delay': 3,
"              \ 'ignore_case': v:true,
"              \ 'smart_case': v:true,
"              \ })
"  autocmd User vimtex call deoplete#custom#var('omni', 'input_patterns', {
"              \ 'tex': g:vimtex#re#deoplete
"              \})

" 'neoclide/coc.nvim' ------------------------
"  Use tab for trigger completion with characters ahead and navigate.
"  Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
"  inoremap <silent><expr> <TAB>
"        \ pumvisible() ? "\<C-n>" :
"        \ <SID>check_back_space() ? "\<TAB>" :
"        \ coc#refresh()
"  inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
"  Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
"  Coc only does snippet and additional edit on confirm.
"  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

"  autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" NOTE: The settings of CocList are not configured because I have not checked
" its functionalities yet.

" 'SirVer/ultisnips' ------------------------
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
let g:UltiSnipsEditSplit = 'context'
set rtp+=~/.config/nvim
let g:UltiSnipsSnippetDirectories = ['~/.config/nvim/UltiSnips', 'UltiSnips']

" 'luochen1990/rainbow' ------------------------
let g:rainbow_active = 1

"  " 'landaire/deoplete-swift' ------------------------
"  let g:deoplete#sources#swift#daemon_autostart = 1
"  autocmd FileType swift imap <buffer> <C-k> <Plug>(autocomplete_swift_jump_to_placeholder)

" 'itchyny/lightline.vim' ------------------------
if version >= 704
    let g:lightline = {
          \ 'colorscheme'       : 'gotham',
          \ 'active'            : {
          \     'left'              :  [ [ 'mode', 'paste' ],
          \                              [ 'fugitive', 'readonly', 'filename', 'modified' ] ],
          \     'right'             :  [ [ 'lineinfo' ],
          \                              [ 'percent' ],
          \                              [ 'fileformat', 'fileencoding', 'filetype' ] ]
          \ },
          \ 'component_function': {
          \     'mode'              : 'LightLineMode',
          \     'fugitive'          : 'LightLineFugitive',
          \     'readonly'          : 'LightLineReadonly',
          \     'modified'          : 'LightLineModified',
          \     'lineinfo'          : 'LightLineLineinfo',
          \     'fileformat'        : 'LightLineFileformat',
          \     'fileencoding'      : 'LightLineFileencoding',
          \     'filetype'          : 'LightLineFiletype'
          \ },
          \ 'separator'         : { 'left': "", 'right': "" },
          \ 'subseparator'      : { 'left': "", 'right': "" }
          \ }

    function! LightLineMode()
        return  &ft == 'denite' ? 'Denite' :
              \ winwidth(0) > 60 ? lightline#mode() : ''
    endfunction

    function! LightLineFugitive()
        if exists("*fugitive#head")
            let _ = fugitive#head()
            let _fname = expand("%:t")
            if winwidth(0) > (strlen(_fname) + 25)
                return strlen(_) ? "\ue0a0"._ : ''
            else
                return strlen(_) ? _ : ''
            endif
        endif
        return ''
    endfunction

    function! LightLineReadonly()
        if &filetype == "help"
            return "\ue0a2"
        elseif &readonly
            "return "\ue0a2"
            return "\U001003a0"
        else
            return ""
        endif
    endfunction

    function! LightLineModified()
        if &filetype == "help"
            return ""
        elseif &modified
            return "+"
        elseif &modifiable
            return ""
        else
            return ""
        endif
    endfunction

    function! LightLineLineinfo()
        let _fname = expand("%:t")
        return "\ue0a1 ". line('.'). ':'. col('.')
    endfunction

    function! LightLineFileformat()
        let _fname = expand("%:t")
        return winwidth(0) > (70 + strlen(_fname)) ? &ff : ''
    endfunction

    function! LightLineFileencoding()
        let _fname = expand("%:t")
        return winwidth(0) > (70 + strlen(_fname)) ? &fenc : ''
    endfunction

    function! LightLineFiletype()
        let _fname = expand("%:t")
        return winwidth(0) > (70 + strlen(_fname)) ? &filetype : ''
    endfunction
endif

" 'lervag/vimtex'
let g:tex_flavor='latex'
let g:tex_conceal='abdmg'
let g:vimtex_enabled = 1
let g:vimtex_compiler_enabled = 1
if has('mac')
    let g:vimtex_view_method = 'skim'
    let g:vimtex_view_general_viewer = '/Applications/Skim.app/Contents/SharedSupport/displayline'
elseif has('unix')
    let g:vimtex_view_method = 'zathura'
endif
let g:vimtex_view_general_options = '-r @line @pdf @tex'
let g:vimtex_compiler_latexmk = {
    \ 'background' : 1,
    \ 'build_dir'  : '',
    \ 'callback'   : 1,
    \ 'continuous' : 1,
    \ 'options': [
    \    '-pdfdvi', 
    \    '-verbose',
    \    '-file-line-error',
    \    '-synctex=1',
    \    '-interaction=nonstopmode',
    \],
    \ }
let g:vimtex_complete_enabled = 1
let g:vimtex_fold_enabled = 1
let g:vimtex_compiler_latexmk_engines = { '_' : '-pdfdvi' }
"let g:vimtex_quickfix_latexlog = {
"    \ 'font' : 0,
"    \ }
let g:vimtex_compiler_progname = 'nvr'

" 'w0rp/ale'
let g:ale_sign_error = '⨉'
let g:ale_sign_warning = '⚠'

let g:markdown_folding = 1
let g:markdown_enable_folding = 1
