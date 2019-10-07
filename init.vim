if has('mac')
    silent exec 'language en_US'
    set spelllang=en_us
endif

" install vim-plug
if !exists('g:plug_path')
    let g:plug_path = expand('$HOME/.local/share/nvim/plugged')
endif

let s:vimplug_path = expand('$HOME/.local/share/nvim/site/autoload/plug.vim')

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

" vim-plug ------------------------
" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin(g:plug_path)

"NOTE: Make sure you use single quotes
Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/vimproc.vim', { 'do': 'make'}

" Completion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neoinclude.vim'
"Plug 'Shougo/neosnippet.vim'
"Plug 'Shougo/neosnippet-snippets'
Plug 'SirVer/ultisnips'
    \ | Plug 'honza/vim-snippets'
Plug 'lervag/vimtex', { 'for': ['tex'] }
Plug 'tweekmonster/deoplete-clang2', { 'for': ['c', 'cpp', 'objc', 'cmake'] }
Plug 'deoplete-plugins/deoplete-jedi', { 'for': ['python'] }
"Plug 'justmao945/vim-clang', { 'for': ['c', 'cpp', 'objc', 'cmake'] }
"Plug 'Shougo/deoplete-clangx', { 'for': ['c', 'cpp', 'objc', 'cmake'] }
"Plug 'osyo-manga/vim-marching', { 'for': ['cpp'] }

" Edit
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-surround'
Plug 'tomtom/tcomment_vim'

" View
"Plug 'nathanaelkane/vim-indent-guides'
"Plug 'itchyny/vim-cursorword'

" Formatter
Plug 'kana/vim-operator-user'
    \ | Plug 'rhysd/vim-clang-format', { 'for': ['c', 'cpp', 'objc', 'java'] }
Plug 'godlygeek/tabular'

" linter
Plug 'w0rp/ale'
"Plug 'scrooloose/syntastic'

" Color Scheme
Plug 'cocopon/colorswatch.vim'
Plug 'cocopon/iceberg.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'nanotech/jellybeans.vim'
Plug 'vim-scripts/darktango.vim'
Plug 'w0ng/vim-hybrid'
Plug 'sjl/badwolf'
Plug 'vim-scripts/Wombat'
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
Plug 'suan/vim-instant-markdown', { 'for': ['markdown'] }
let g:instant_markdown_autostart = 0

" Swift
Plug 'keith/swift.vim', { 'for': 'swift' }
Plug 'landaire/deoplete-swift', { 'for': 'swift' }

" JavaScript
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'othree/yajs.vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'othree/es.next.syntax.vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'othree/javascript-libraries-syntax.vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'kchmck/vim-coffee-script'
Plug 'maxmellon/vim-jsx-pretty', { 'for': ['javascript', 'javascript.jsx'] }

" TypeScript
Plug 'leafgarland/typescript-vim'

" man
"Plug 'vim-utils/vim-man'
"Plug 'nhooyr/neoman.vim'

call plug#end()

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
if has('gui_macvim')
    colorscheme darktango
else
    colorscheme nord
endif
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

set wildoptions=pum
set pumblend=20

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
set inccommand=split

" edit
scriptencoding utf-8
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,ucs-bom,iso-20220jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932,latin1
set fileformats=unix,dos,mac
set shiftwidth=4
set cinoptions+=:0,g0
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
augroup swapchoice-readonly
    autocmd!
    autocmd SwapExists * let v:swapchoice = 'o'
augroup END
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
if has('mac')
    let g:python_host_prog = expand('/usr/local/bin/python2')
    let g:python3_host_prog = expand('/usr/local/bin/python3')
elseif has('unix')
    let g:python_host_prog = expand('/usr/bin/python2')
    let g:python3_host_prog = expand('/usr/bin/python3')
endif

" custom commands
"  Rename command
command! -nargs=1 -complete=file Rename f <args>|call delete(expand('#'))

" 'Shougo/deoplete' ------------------------
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_ignore_case = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#auto_complete_delay = 30
let g:deoplete#omni#input_patterns = {}
let g:deoplete#omni#input_patterns.tex =
            \   '\\(?:'
            \  .   '\w*cite\w*(?:\s*\[[^]]*\]){0,2}\s*{[^}]*'
            \  .  '|\w*ref(?:\s*\{[^}]*|range\s*\{[^,}]*(?:}{)?)'
            \  .  '|hyperref\s*\[[^]]*'
            \  .  '|includegraphics\*?(?:\s*\[[^]]*\]){0,2}\s*\{[^}]*'
            \  .  '|(?:include(?:only)?|input)\s*\{[^}]*'
            \  .')'
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" 'SirVer/ultisnips' ------------------------
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
let g:UltiSnipsEditSplit = 'context'
set rtp+=~/.config/nvim
let g:UltiSnipsSnippetDirectories = ['~/.config/nvim/UltiSnips', 'UltiSnips']

" 'luochen1990/rainbow' ------------------------
let g:rainbow_active = 1

" 'landaire/deoplete-swift' ------------------------
let g:deoplete#sources#swift#daemon_autostart = 1
autocmd FileType swift imap <buffer> <C-k> <Plug>(autocomplete_swift_jump_to_placeholder)

" 'itchyny/lightline.vim' ------------------------
if version >= 704
    let g:lightline = {
          \ 'colorscheme'       : 'iceberg',
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
          \ 'separator'         : { 'left': "\ue0b0", 'right': "\ue0b2" },
          \ 'subseparator'      : { 'left': "\ue0b1", 'right': "\ue0b3" }
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
            return "\ue0a2"
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
set conceallevel=1
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
let g:vimtex_quickfix_latexlog = {
    \ 'font' : 0,
    \ }
let g:vimtex_compiler_progname = 'nvr'

" 'w0rp/ale'
let g:ale_sign_error = '⨉'
let g:ale_sign_warning = '⚠'
