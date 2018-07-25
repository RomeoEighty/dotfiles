
if has('mac')
    silent exec 'language en_US'
    set spelllang=en_us
endif

" =================================================
"  vim-plug
" =================================================
" {{{
" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.local/share/nvim/plugged')

"NOTE: Make sure you use single quotes
Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'Shougo/deoplete.nvim', { 'commit': 'd247740fe68d256f9c5fa6cab35dba1a93c1c3bb', 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    \ | Plug 'tweekmonster/deoplete-clang2', { 'for': ['c', 'cpp', 'objc', 'cmake'] }
Plug 'Shougo/neoinclude.vim'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'Shougo/vimproc.vim', { 'do': 'make'}
    \ | Plug 'rhysd/vim-clang-format', { 'for': ['c', 'cpp', 'objc', 'java'] }
Plug 'cocopon/colorswatch.vim'
Plug 'dyng/ctrlsf.vim', { 'on': 'CtrlSF' }
Plug 'godlygeek/tabular'
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-cursorword'
Plug 'kana/vim-operator-user'
    \ | Plug 'rhysd/vim-clang-format', { 'for': ['c', 'cpp', 'objc', 'java'] }
Plug 'lervag/vimtex', { 'for': ['tex'] }
Plug 'nachumk/systemverilog.vim', { 'for': ['verilog', 'systemverilog'] }
"Plug 'vhda/verilog_systemverilog.vim', { 'for': ['verilog', 'systemverilog', 'verilog_systemverilog'] }
Plug 'osyo-manga/vim-marching'
"Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'scrooloose/nerdtree'
" Plug 'scrooloose/syntastic'
Plug 'sjl/gundo.vim'
Plug 'suan/vim-instant-markdown', { 'for': ['markdown'] }
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
"Plug 'nathanaelkane/vim-indent-guides'
Plug 'keith/swift.vim', { 'for': 'swift' }
Plug 'vim-scripts/applescript.vim'
Plug 'vim-utils/vim-man'
Plug 'vimwiki/vimwiki'
Plug 'w0rp/ale'

Plug 'severin-lemaignan/vim-minimap'

" javascript plugins
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'othree/yajs.vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'othree/es.next.syntax.vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'othree/javascript-libraries-syntax.vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'kchmck/vim-coffee-script'

" typescript plugins
Plug 'leafgarland/typescript-vim'

" Colorscheme
" note: make sure install appropriate nord theme to your terminal beforehand
Plug 'arcticicestudio/nord-vim'
Plug 'nanotech/jellybeans.vim'
Plug 'vim-scripts/darktango.vim'
Plug 'w0ng/vim-hybrid'
Plug 'sjl/badwolf'
Plug 'vim-scripts/Wombat'
Plug 'zaki/zazen'
Plug 'zchee/deoplete-jedi'
Plug 'maxmellon/vim-jsx-pretty', { 'for': ['javascript', 'javascript.jsx'] }

" Initialize plugin system
call plug#end()
" }}}

" =================================================
"  highlight setting
" =================================================
" highlight setting must be above the colorscheme setting
" {{{
" highlight inappropriate spaces
augroup highlightFullwidthSpace
    autocmd!
    autocmd Colorscheme * highlight FullwidthSpace term=underline ctermbg=DarkRed guibg=DarkRed
    autocmd VimEnter,WinEnter * match FullwidthSpace /\%u180E\|\%u2000\|\%u2001\|\%u2002\|\%u2003\|\%u2004\|\%u2005\|\%u2006\|\%u2007\|\%u2008\|\%u2009\|\%u200A\|\%u2028\|\%u2029\|\%u202F\|\%u205F\|\%u3000\|　/
augroup END
" }}}

" =================================================
"  base setting
" =================================================
" {{{
set nocompatible
syntax on
if has('gui_macvim')
    colorscheme darktango
else
    "colorscheme jellybeans
    colorscheme nord
endif
if (v:version >= 704 && has('cryptv'))
    set cryptmethod=blowfish2
endif
" }}}

" =================================================
"  display
" =================================================
" {{{
set number
if v:version >= 703
    set norelativenumber " This option may affect performance!
endif
set ruler
set laststatus=2
set fileencodings=utf-8,ucs-bom,iso-20220jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932,latin1
set fileencoding=utf-8
set encoding=utf-8
scriptencoding utf-8
set fileformats=unix,dos,mac
set foldmethod=marker
set splitright
set splitbelow
set showcmd
" 折り返しをする
set wrap
" 折り返しの時のインデント
if exists('+breakindent')
    set breakindent
endif
" 長い行の表示
set display=lastline
" 補完候補の数
set pumheight=10
" }}}

" =================================================
"  nathanaelkane/vim-indent-guides
" =================================================
" {{{
" let g:indent_guides_enable_on_vim_startup = 1
" let g:indent_guides_auto_colors = 0
" autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=0
" autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=8
" }}}

" =================================================
"  edit
" =================================================
" {{{
set list
set listchars=tab:>\ ,eol:$
set tabstop=4
set cinoptions+=:0,g0
set autoindent
" this clipboard setting changes visual yank and paste behaviors
if has('mac')
    set clipboard+=unnamed
elseif has('unix')
    set clipboard+=unnamedplus
endif
set expandtab
set smarttab
"set conceallevel=0

let _curfile=expand("%:r")
if _curfile == 'Makefile'
  set noexpandtab
endif

set shiftwidth=4
if !has('nvim')
    set ttymouse=xterm2
endif
" showmatch time 0.1*x(default 5)
set matchtime=1
set mouse=n
set backspace=indent,eol,start
set nocursorline " This option slows down vim response!
set smartindent
set swapfile
set directory=.
set nobackup
if has('mac')
    set path+=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.12.sdk/usr/include;\
              \/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include/c++/v1/
elseif has('unix')
    set path+=/usr/local/include;/usr/include
endif

" set backupdir=~/.Trash/tmp/

" Rename command definition
command! -nargs=1 -complete=file Rename f <args>|call delete(expand('#'))

if has('mac')
    let g:python_host_prog = expand('/usr/local/bin/python2')
    let g:python3_host_prog = expand('/usr/local/bin/python3')
elseif has('unix')
    let g:python_host_prog = expand('/usr/bin/python2')
    let g:python3_host_prog = expand('/usr/bin/python3')
endif
augroup fileTypeIndent
    autocmd!
    autocmd BufNewFile,BufRead *.rb setlocal tabstop=2 softtabstop=2 shiftwidth=2
augroup END
" }}}

" =================================================
"  .swp setting
" =================================================
augroup swapchoice-readonly
    autocmd!
    autocmd SwapExists * let v:swapchoice = 'o'
augroup END

" =================================================
"  search
" =================================================
set hlsearch
set incsearch
set ignorecase
set smartcase
set wildignorecase

" =================================================
"  keymapping
" =================================================
nnoremap j gj
nnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk
nnoremap <ESC><ESC> :noh<CR>

" =================================================
"  Remember where the cursor was
" =================================================
" {{{
if has("autocmd")
    augroup redhat
        " In text files, always limit the width of text to 78 characters
        " autocmd BufRead *.txt set tw=78
        " When editing a file, always jump to the last cursor position
        autocmd BufReadPost *
        \ if line("'\"") > 0 && line ("'\"") <= line("$") |
        \   exe "normal! g'\"" |
        \ endif
    augroup END
endif
" }}}

" =================================================
"  lightline
" =================================================
" {{{
if version >= 704
    let g:lightline = {
          \ 'colorscheme'       : 'nord',
          \ 'active'            : {
          \     'left'              :  [ [ 'mvim', 'mode', 'paste' ],
          \                              [ 'fugitive', 'readonly', 'filename', 'modified' ] ],
          \     'right'             :  [ [ 'lineinfo' ],
          \                              [ 'percent' ],
          \                              [ 'fileformat', 'fileencoding', 'filetype' ] ]
          \ },
          \ 'component_function': {
          \     'mvim'              : 'LightLineMacVim',
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
    function! LightLineMacVim()
        if has('gui_macvim')
            return 'mvim'
        else
            return ''
        endif
    endfunction

    function! LightLineMode()
        return  &ft == 'unite' ? 'Unite' :
              \ &ft == 'vimfiler' ? 'VimFiler' :
              \ winwidth(0) > 60 ? lightline#mode() : ''
    endfunction

    function! LightLineFugitive()
        if exists("*fugitive#head")
            let _ = fugitive#head()
            let _fname = expand("%:t")
            if winwidth(0) > (strlen(_fname) + 25)
                return strlen(_) ? "\ue0a0"._ : ''
            else
                return strlen(_) ? "\ue0a0" : ''
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
" }}}

" =================================================
"  scrooloose/nerdtree
" =================================================
" {{{
nnoremap <Leader>f :NERDTreeToggle<Enter>
nnoremap <silent> <Leader>v :NERDTreeFind<CR>
" }}}

" =================================================
"  Shougo/deoplete.nvim
" =================================================
" {{{
"set completeopt+=noinsert
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_ignore_case = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#auto_complete_delay = 30
"let g:deoplete#enable_refresh_always = 1 " Note: It increases the screen flicker.
let g:deoplete#sources     = {}
let g:deoplete#sources._   = ['buffer']
let g:deoplete#sources.cpp = ['buffer', 'tag', 'file']
"let g:deoplete#omni_patterns       = {}
"let g:deoplete#omni_patterns.cpp   = ['[^. *\t]\.\w*','[^. *\t]\::\w*','[^. *\t]\->\w*','#include\s*[<"][^>"]*']
"let g:deoplete#omni#input_patterns      = {}
"let g:deoplete#omni#input_patterns.html = '<[^>]*'
"let g:deoplete#omni#input_patterns.xml  = '<[^>]*'
"let g:deoplete#omni#input_patterns.md   = '<[^>]*'
"let g:deoplete#omni#input_patterns.css  = '^\s\+\w\+\|\w\+[):;]\?\s\+\w*\|[@!]'
"let g:deoplete#omni#input_patterns.scss = '^\s\+\w\+\|\w\+[):;]\?\s\+\w*\|[@!]'
"let g:deoplete#omni#input_patterns.sass = '^\s\+\w\+\|\w\+[):;]\?\s\+\w*\|[@!]'
"let g:deoplete#omni#input_patterns.c    = ['[^.[:digit:] *\t]\%(\.\|->\)\w*','#include\s*[<"][^>"]*']
"let g:deoplete#omni#input_patterns.cpp  = ['[^. *\t]\.\w*','[^. *\t]\::\w*','[^. *\t]\->\w*']
"let g:deoplete#omni#input_patterns.cpp  = ['[^. *\t]\.\w*','[^. *\t]\::\w*','[^. *\t]\->\w*','#include\s*[<"][^>"]*']
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

" -------------------------------------------------
"  tweekmonster/deoplete-clang2
" -------------------------------------------------
" {{{
let g:deoplete#sources = {}
let g:deoplete#sources#clang#executable='/usr/bin/clang'
let g:deoplete#sources#clang#flags=['-darwin=10.12']
"let g:deoplete#sources#clang#libclang_path='/Library/Developer/CommandLineTools/usr/lib/libclang.dylib'
"let g:deoplete#sources#clang#clang_header='/Library/Developer/CommandLineTools/usr/lib/clang'
" }}}
" }}}

" =================================================
"  lervag/vimtex
" =================================================
" {{{
"let g:vimtex_view_general_viewer = 'open'
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
    \ 'options'    : [
    \      '-pdfdvi',
    \      '-verbose',
    \      '-interaction=nonstopmode',
    \      '-synctex=1',
    \      '-file-line-error',
    \   ],
    \ }
let g:vimtex_complete_enabled = 1
let g:vimtex_fold_enabled = 1
" }}}

" =================================================
"  Shougo/neoinclude.vim
" =================================================
" {{{
"if !exists('g:neocomplete#force_omni_input_patterns')
"    let g:neocomplete#force_omni_input_patterns = {}
"endif
"let g:neocomplete#force_omni_input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)\w*'
"let g:neocomplete#force_omni_input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'
"set path+=/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include/c++/v1
let g:neoinclude#ctags_command="/usr/local/bin/ctags"
"if has('mac')
    let g:neoinclude#paths = {
        \ 'c'   : '.,./lib,./lib/STM32F10x_StdPeriph_Driver/inc,./lib/CMSIS/CM3/CoreSupport,./lib/CMSIS/CM3/DeviceSupport/ST/STM32F10x,./inc,/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.13.sdk/usr/include',
        \ 'cpp' : '.,/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include/c++/v1',
    \ }
"endif
let g:neoinclude#patterns = {
        \ 'c'   : '^#\s*include\s',
        \ 'cpp' : '^#\s*include\s',
    \ }
if !exists('g:neoinclude#exts')
    let g:neoinclude#exts = {}
endif
let g:neoinclude#exts.c    = ['h']
let g:neoinclude#exts.cpp  = ['', 'h', 'hpp', 'hxx']
let g:neoinclude#exts.objc = ['', 'h', 'hpp', 'hxx']
let g:neoinclude#exts.v    = ['', 'v']
"let $CPP_STDLIB = '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include/c++/v1'
"augroup vimrc-set_filetype_cpp
"    autocmd!
"    "$CPP_STDLIBよりも下の階層のファイルが開かれて
"    "filetypeが設定されていない場合にfiletype=cppを設定する
"    autocmd BufReadPost $CPP_STDLIB/* if empty(&filetype) | set filetype=cpp | endif
"augroup END
" }}}

" =================================================
"  Shougo/denite.nvim
" =================================================
" {{{
" Change file_rec command.
call denite#custom#var('file_rec', 'command',
    \ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
" For ripgrep
" Note: It is slower than ag
" call denite#custom#var('file_rec', 'command',
" \ ['rg', '--files', '--glob', '!.git', ''])
" For Pt(the platinum searcher)
" NOTE: It also supports windows.
" call denite#custom#var('file_rec', 'command',
" \ ['pt', '--follow', '--nocolor', '--nogroup', '-g:', ''])

" Change mappings.
call denite#custom#map(
    \ 'insert',
    \ '<C-j>',
    \ '<denite:move_to_next_line>',
    \ 'noremap'
    \)
call denite#custom#map(
    \ 'insert',
    \ '<C-k>',
    \ '<denite:move_to_previous_line>',
    \ 'noremap'
    \)

" Change matchers.
call denite#custom#source(
    \ 'file_mru', 'matchers', ['matcher_fuzzy', 'matcher_project_files'])
call denite#custom#source(
    \ 'file_rec', 'matchers', ['matcher_cpsm'])

" Change sorters.
call denite#custom#source(
    \ 'file_rec', 'sorters', ['sorter_sublime'])

" Add custom menus
let s:menus = {}

let s:menus.zsh = {
    \ 'description': 'Edit your import zsh configuration'
    \ }
let s:menus.zsh.file_candidates = [
    \ ['zshrc', '~/.config/zsh/.zshrc'],
    \ ['zshenv', '~/.zshenv'],
    \ ]

let s:menus.my_commands = {
    \ 'description': 'Example commands'
    \ }
let s:menus.my_commands.command_candidates = [
    \ ['Split the window', 'vnew'],
    \ ['Open zsh menu', 'Denite menu:zsh'],
    \ ]

call denite#custom#var('menu', 'menus', s:menus)

" Ag command on grep source
call denite#custom#var('grep', 'command', ['ag'])
call denite#custom#var('grep', 'default_opts',
        \ ['-i', '--vimgrep'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', [])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

" Ack command on grep source
call denite#custom#var('grep', 'command', ['ack'])
call denite#custom#var('grep', 'default_opts',
        \ ['--ackrc', $HOME.'/.ackrc', '-H',
        \  '--nopager', '--nocolor', '--nogroup', '--column'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', ['--match'])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

" Ripgrep command on grep source
call denite#custom#var('grep', 'command', ['rg'])
call denite#custom#var('grep', 'default_opts',
        \ ['--vimgrep', '--no-heading'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

" Pt command on grep source
call denite#custom#var('grep', 'command', ['pt'])
call denite#custom#var('grep', 'default_opts',
        \ ['--nogroup', '--nocolor', '--smart-case'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', [])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

call denite#custom#source('file_mru', 'converters',
    \ ['converter_relative_word'])

" Define alias
call denite#custom#alias('source', 'file_rec/git', 'file_rec')
call denite#custom#var('file_rec/git', 'command',
    \ ['git', 'ls-files', '-co', '--exclude-standard'])

" Change default prompt
call denite#custom#option('default', 'prompt', '>')

" Change ignore_globs
call denite#custom#filter('matcher_ignore_globs', 'ignore_globs',
    \ [ '.git/', '.ropeproject/', '__pycache__/',
    \   'venv/', 'images/', '*.min.*', 'img/', 'fonts/'])
" }}}

" =================================================
"  Shougo/neosnippet.vim
" =================================================
" {{{
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
 
" SuperTab like snippets' behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <expr><TAB>
            \ pumvisible() ? "\<C-n>" :
            \ neosnippet#expandable_or_jumpable() ?
            \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
            \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
    set conceallevel=2
    "set concealcursor=nv
endif

" Enable snipMate compatibility feature.
" let g:neosnippet#enable_snipmate_compatibility = 1

" Expand the completed snippet trigger by <CR>.
imap <expr><CR>
            \ (pumvisible() && neosnippet#expandable()) ?
            \ "\<Plug>(neosnippet_expand)" : "\<CR>"
" }}}

" =================================================
"  For marching.vim "
" =================================================
" {{{
" path to clang command
let g:marching_clang_command = "/usr/bin/clang++"
let g:marching_clang_command_option = "-std=c++11 -Wall -Wextra -Wconversion"

" directory paths to include
if has('mac')
    let g:marching_include_paths = [
    \   '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include/c++/v1'
    \]
endif

" cooperate with neocomplete.vim
let g:marching_enable_neocomplete = 1

if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif

let g:neocomplete#force_omni_input_patterns.cpp =
    \ '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'
" }}}

" =================================================
"  w0rp/ale
" =================================================
" {{{
let g:ale_sign_error = '⨉'
let g:ale_sign_warning = '⚠'
" jsx
augroup FiletypeGroup
    autocmd!
    au BufNewFile,BufRead *.jsx set filetype=javascript.jsx
augroup END
let g:ale_linters = {'jsx': ['stylelint', 'eslint']}
let g:ale_linter_aliases = {'jsx': 'css'}
" }}}
