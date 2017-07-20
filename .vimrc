if version >= 704
    "dein Scripts-----------------------------
    if &compatible
        set nocompatible               " Be iMproved
    endif

    " Required: Multi Operating System Adaptability
    set runtimepath^=$HOME/.vim/dein/repos/github.com/Shougo/dein.vim
    call dein#begin(expand('$HOME/.vim/dein'))

    " Let dein manage dein
    " Required:
    call dein#add('Shougo/dein.vim')

    " Add or remove your plugins here:
    call dein#add('Shougo/denite.nvim')
    call dein#add('Shougo/neocomplete.vim')
    call dein#add('Shougo/neoinclude.vim')
    call dein#add('Shougo/neosnippet.vim')
    call dein#add('Shougo/neosnippet-snippets')
    call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
    call dein#add('cocopon/colorswatch.vim')
    call dein#add('dyng/ctrlsf.vim')
    call dein#add('itchyny/lightline.vim')
    call dein#add('itchyny/vim-cursorword')
    call dein#add('osyo-manga/vim-marching')
    call dein#add('itchyny/vim-cursorword')
    call dein#add('scrooloose/nerdtree')
    call dein#add('scrooloose/syntastic')
    call dein#add('sjl/gundo.vim')
    call dein#add('tpope/vim-fugitive')
    call dein#add('keith/swift.vim')

    "colorschemes
    call dein#add('arcticicestudio/nord-vim')
    call dein#add('nanotech/jellybeans.vim')
    call dein#add('vim-scripts/darktango.vim')
    call dein#add('w0ng/vim-hybrid')
    call dein#add('sjl/badwolf')
    call dein#add('vim-scripts/Wombat')
    call dein#add('zaki/zazen')

    "unused plugin
    "call dein#add('Rip-Rip/clang_complete')
    "call dein#add('justmao945/vim-clang')

    " You can specify revision/branch/tag.
"   call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

    " Required:
    call dein#end()

    " Required:
    filetype plugin indent on

    " If you want to install not installed plugins on startup.
    if dein#check_install()
        call dein#install()
    endif

    "End dein Scripts-------------------------
endif

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
    set relativenumber " This option may affect performance!
endif
set ruler
set laststatus=2
set fileencodings=utf-8,ucs-bom,iso-20220jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932,latin1
set fileencoding=utf-8
set encoding=utf-8
scriptencoding utf-8
set fileformats=unix,dos,mac
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
set guifont=SF\ Mono\ for\ Powerline
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
set clipboard+=unnamed
"set clipboard=exclude:.*
set expandtab
set smarttab

let _curfile=expand("%:r")
if _curfile == 'Makefile'
  set noexpandtab
endif

set shiftwidth=4
set ttymouse=xterm2
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
endif
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
"  lightline
" =================================================
" {{{
if version >= 704
    let g:lightline = {
          \ 'colorscheme'       : 'nord',
          \ 'active'            : {
          \     'left'              :  [ [ 'mvim', 'mode', 'paste' ],
          \                              [ 'fugitive', 'readonly', 'filename', 'modified' ] ],
          \     'right'             :  [ [ 'syntastic', 'lineinfo' ],
          \                              [ 'percent' ],
          \                              [ 'fileformat', 'fileencoding', 'filetype' ] ]
          \ },
          \ 'component_expand'  : {
          \     'syntastic'     : 'SyntasticStatuslineFlag'
          \ },
          \ 'component_type'    : {
          \     'syntastic'         : 'error'
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
              \ &ft == 'vimshell' ? 'VimShell' :
              \ winwidth(0) > 60 ? lightline#mode() : ''
    endfunction

    function! LightLineFugitive()
        if exists("*fugitive#head")
            let _ = fugitive#head()
            let _fname = expand("%")
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
        let _fname = expand("%")
        if winwidth(0) > 20 + strlen(_fname)
            return "\ue0a1 ". line('.'). '/'. line('$'). ':'. col('.'). '/'. col('$')
        else
            return "\ue0a1 ". line('.'). ':'. col('.')
        endif
    endfunction

    function! LightLineFileformat()
        let _fname = expand("%")
        return winwidth(0) > (10 + strlen(_fname)) ? &ff : ''
    endfunction

    function! LightLineFileencoding()
        let _fname = expand("%")
        return winwidth(0) > (10 + strlen(_fname)) ? &fenc : ''
    endfunction

    function! LightLineFiletype()
        let _fname = expand("%")
        return winwidth(0) > (10 + strlen(_fname)) ? &filetype : ''
    endfunction
endif
" }}}

"-------------------------------------------------
" denite.nvim
"-------------------------------------------------
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
"-------------------------------------------------
" neocomplete.vim
"-------------------------------------------------
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop. neocomplete conflicts with AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#max_list = 20
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
"let g:neocomplete#sources#dictionary#dictionaries = {
"    \ 'default' : '',
"    \ 'scheme'  : $HOME.'/.gosh_completions'
"    \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css           setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript    setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python        setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml           setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.c   = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

" for c and c++
"if !exists('g:neocomplete#force_omni_input_patterns')
"    let g:neocomplete#force_omni_input_patterns = {}
"endif
" let g:neocomplete#force_omni_input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)\w*'
"let g:neocomplete#force_omni_input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'

"  "-------------------------------------------------
"  " For vim-clang "
"  "-------------------------------------------------
"  " disable auto completion after ->, ., :: for vim-clang
"  let g:clang_auto = 0
"  
"  " default 'longest' can not work with neocomplete
"  let g:clang_c_completeopt   = 'menuone'
"  let g:clang_cpp_completeopt = 'menuone'
"  
"  let g:clang_cpp_options = '-std=c++11 -stdlib=libc++'

"-------------------------------------------------
" For neosnippet "
"-------------------------------------------------
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
 
" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"
 
" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

"-------------------------------------------------
" For syntastic "
"-------------------------------------------------
if version >= 704
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*

    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_wq = 0
endif

"-------------------------------------------------
" For syntastic in lightline "
"-------------------------------------------------
if version >= 704
    let g:syntastic_mode_map = { 'mode' : 'passive' }
"   augroup AutoSyntastic
"       autocmd!
"       autocmd BufWritePost *.c,*.cpp call s:syntastic()
"   augroup END

    function! s:syntastic()
        SyntasticCheck
    call lightline#update()
    endfunction
endif

"-------------------------------------------------
" For neoinclude "
"-------------------------------------------------
"if !exists('g:neocomplete#force_omni_input_patterns')
"    let g:neocomplete#force_omni_input_patterns = {}
"endif
"let g:neocomplete#force_omni_input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)\w*'
"let g:neocomplete#force_omni_input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'
setlocal path+=/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include/c++/v1
let g:neoinclude#ctags_command=""
"if has('mac')
    let g:neoinclude#paths = {
        \ 'c'   : '.,/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.12.sdk/usr/include',
        \ 'cpp' : '.,/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include/c++/v1',
    \ }
"endif
let g:neoinclude#patterns = {
        \ 'cpp' : '^\s*#\s*include'
    \ }
if !exists('g:neoinclude#exts')
    let g:neoinclude#exts = {}
endif
let g:neoinclude#exts.cpp = ['', 'h', 'hpp', 'hxx']
let $CPP_STDLIB = '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include/c++/v1'
augroup vimrc-set_filetype_cpp
    autocmd!
    "$CPP_STDLIBよりも下の階層のファイルが開かれて
    "filetypeが設定されていない場合にfiletype=cppを設定する
    autocmd BufReadPost $CPP_STDLIB/* if empty(&filetype) | set filetype=cpp | endif
augroup END

"-------------------------------------------------
" Remember where the cursor was
"-------------------------------------------------
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

"-------------------------------------------------
" For marching.vim "
"-------------------------------------------------
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
