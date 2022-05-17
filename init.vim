  setlocal list
    set listchars=tab:\¦\    " Tab charactor

  set ignorecase        " Enable case-sensitive
  " Disable backup
  set nobackup
  set nowb
  set noswapfile

  " Leader
  let mapleader = ","

  set backspace=2   " Backspace deletes like most programs in insert mode
  set nobackup
  set nowritebackup
  set noswapfile
  set history=50
  set ruler         " show the cursor position all the time
  set showcmd       " display incomplete commands
  set incsearch     " do incremental searching
  set laststatus=2  " Always display the status line
  set autowrite     " Automatically :write before running commands


  " Softtabs, 2 spaces
  set tabstop=2
  set shiftwidth=2
  set shiftround
  set expandtab
  "Display extra whitespace
  "set listchars=tab:\¦\,trail:·,nbsp:·

  " Use one space, not two, after punctuation.
  set nojoinspaces

  " Numbers
  set relativenumber
  set number

  " Open new split panes to right and bottom, which feels more natural
  set splitbelow
  set splitright

  " Autocomplete with dictionary words when spell check is on
  set complete+=kspell

  " Always use vertical diffs
  set diffopt+=vertical

  " Disable automatic comment in newline
  autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

  syntax on


  call plug#begin('~/.config/nvim/plugged')

  " Theme
    "Plug 'joshdick/onedark.vim'           " grubox
    Plug 'chriskempson/base16-vim'


  " File browser
    Plug 'preservim/nerdTree'             " File browser
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
    Plug 'unkiwii/vim-nerdtree-sync'

  " File search
    Plug 'junegunn/fzf',
      \ { 'do': { -> fzf#install() } }      " Fuzzy finder
    Plug 'junegunn/fzf.vim'

  " Status bar
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    " Terminal
    Plug 'voldikss/vim-floaterm'

  " Code intellisense
    Plug 'neoclide/coc.nvim', {'branch': 'release'} " Language server
    Plug 'jiangmiao/auto-pairs'           " Parenthesis auto
    Plug 'alvan/vim-closetag'
    Plug 'mattn/emmet-vim'
    Plug 'preservim/nerdcommenter'          " Comment code
    Plug 'alvan/vim-closetag'             " Auto close HTML/XML tag
    Plug 'preservim/tagbar'
    Plug 'majutsushi/tagbar'
  " Code syntax highlight
    Plug 'yuezk/vim-js'               " Javascript
    Plug 'MaxMEllon/vim-jsx-pretty'         " JSX/React
    Plug 'jackguo380/vim-lsp-cxx-highlight'     " C++ syntax
    Plug 'uiiaoo/java-syntax.vim'

  " Source code version control
   Plug 'tpope/vim-fugitive'
    " Plug 'bfredl/nvim-ipy'
 Plug 'jpalardy/vim-slime', { 'for': 'python' }
  Plug 'hanschen/vim-ipython-cell', { 'for': 'python' }
    
  call plug#end()


  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " => Plugin Setting
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " Set theme

  colorscheme base16-isotope
   " Overwrite some color highlight
  if (has("autocmd"))
    augroup colorextend
      autocmd ColorScheme
        \ * call base16-default-dark#extend_highlight("Comment",{"fg": {"gui": "#728083"}})
      autocmd ColorScheme
        \ * call base16-default-dark#extend_highlight("LineNr", {"fg": {"gui": "#728083"}})
    augroup END
  endif

  " Disable automatic comment in newline

  autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o


  " Airline Setting
  let g:airline_powerline_fonts = 1               " Enable font for status bar
  let g:airline_theme= 'base16_shapeshifter'                 " Theme OneDark
  let g:airline_section_b = '%{strftime("%H:%M")}'
  let g:airline#extensions#tabline#enabled = 1        " Enable Tab bar
  let g:airline#extensions#tabline#left_sep = ' '       " Enable Tab seperator
  let g:airline#extensions#tabline#left_alt_sep = '|'     " Enable Tab seperator
  let g:airline#extensions#tabline#formatter = 'default'
  let g:airline#extensions#tabline#fnamemod = ':t'      " Set Tab name as file name

  let g:airline#extensions#whitespace#enabled = 0       " Remove warning whitespace"



  " Floatterm Setting

  let g:floaterm_position = 'topright'
  let g:floaterm_width = 0.6
  let g:floaterm_height = 0.6
  let g:floaterm_title = 'Terminal $1/$2'
  let g:floaterm_wintype = 'float'
  let g:floaterm_rootmarkers = ['.pro']
  """ Set color
  hi Floaterm guibg=Grey15
  hi FloatermBorder guifg=Orange guibg=DarkGreen
  ""hi FloatermNC guibg=darkred
  nnoremap   <silent> <C-t>    :FloatermNew<CR>
  tnoremap   <silent> <C-t>    <C-\><C-n>:FloatermNew<CR>
  nnoremap   <silent>   <F8>    :FloatermPrev<CR>
  tnoremap   <silent>   <F8>    <C-\><C-n>:FloatermPrev<CR>
  nnoremap   <silent>   <F9>    :FloatermNext<CR>
  tnoremap   <silent>   <F9>    <C-\><C-n>:FloatermNext<CR>
  nnoremap   <silent>   <C-x>   :FloatermToggle<CR>
  tnoremap   <silent>   <C-x>   <C-\><C-n>:FloatermToggle<CR>
  nnoremap <silent> <C-k> :FloatermKill<CR>:FloatermPrev<CR>
  tnoremap <silent> <C-k> <C-\><C-n>:FloatermKill<CR>:FloatermPrev<CR>

  "" Git
  nnoremap   <F10>    :FloatermNew --position=bottomleft --height=0.8 --width=0.6 --title='Git' lazygit<CR>
  " fzf
  """ This is the default extra key bindings
  let g:fzf_action = {
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-x': 'split',
      \ 'ctrl-v': 'vsplit' }

  let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.5, 'highlight': 'Comment' } }
  let g:fzf_preview_window = ['right:50%', 'ctrl-/']
  let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

  hi! fzf_fg ctermfg=14
  hi! fzf_fgp ctermfg=3
  hi! fzf_hl ctermfg=5
  hi! fzf_hlp ctermfg=5
  hi! fzf_info ctermfg=6
  hi! fzf_prompt ctermfg=6
  hi! fzf_spinner ctermfg=6
  hi! fzf_pointer ctermfg=3
  let g:fzf_colors = {
      \ 'fg':      ['fg', 'fzf_fg'],
      \ 'hl':      ['fg', 'fzf_hl'],
      \ 'fg+':     ['fg', 'fzf_fgp'],
      \ 'hl+':     ['fg', 'fzf_hlp'],
      \ 'info':    ['fg', 'fzf_info'],
      \ 'prompt':  ['fg', 'fzf_prompt'],
      \ 'pointer': ['fg', 'fzf_pointer'],
      \ 'spinner': ['fg', 'fzf_spinner'] }

  """ :Files
  command! -bang -nargs=? -complete=dir Files
     \ call fzf#vim#files(<q-args>, {'options': ['--layout=reverse', '--info=inline', '--preview', 'bat --color=always --theme=TwoDark --style=header,numbers,snip --line-r  ange :300 {}']}, <bang>0)

  """ :Rg
  command! -bang -nargs=* Rg
    \ call fzf#vim#grep(
    \   'rg --column --line-number --color=always --smart-case -- '.shellescape(<q-args>), 1, {'options': ['--exact', '--layout=reverse']}, <bang>0)
  map <F7> :Rg<CR>

  """ History
  map <C-/> :History/<CR>

  " nerdcommenter

  " Create default mappings
  let g:NERDCreateDefaultMappings = 1

  " Add spaces after comment delimiters by default
  let g:NERDSpaceDelims = 1

  " Use compact syntax for prettified multi-line comments
  let g:NERDCompactSexyComs = 1

  " Align line-wise comment delimiters flush left instead of following code indentation
  let g:NERDDefaultAlign = 'left'

  " Set a language to use its alternate delimiters by default
  let g:NERDAltDelims_java = 1

  " Add your own custom formats or override the defaults
  let g:NERDCustomDelimiters = { 'c, js': { 'left': '/**','right': '*/' } }

  " Allow commenting and inverting empty lines (useful when commenting a region)
  let g:NERDCommentEmptyLines = 1

  " Enable trimming of trailing whitespace when uncommenting
  let g:NERDTrimTrailingWhitespace = 1

  " Enable NERDCommenterToggle to check all selected lines is commented or not
  let g:NERDToggleCheckAllLines = 1

  " Start NERDTree. If a file is specified, move the cursor to its window.
  " autocmd StdinReadPre * let s:std_in=1
  " autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif

  " NerdTree
  """ Hightlight current file
  let g:nerdtree_sync_cursorline = 1
  map <silent> <C-p> :NERDTreeToggle<CR>

  " Open the existing NERDTree on each new tab.
  "autocmd BufWinEnter * silent NERDTreeMirror

  " Exit Vim if NERDTree is the only window left.
  autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

  " Change arrow to expand/collapse tree
  let g:NERDTreeDirArrowExpandable = '▸'
  let g:NERDTreeDirArrowCollapsible = '▾'

  " Vimspector
  nnoremap  <Leader>dl :call vimspector#Launch()<CR>
  nnoremap  <Leader>ds :call vimspector#Reset()<CR>
  nnoremap  <Leader>dc :call vimspector#Continue()<CR>
 nnoremap  <Leader>dt :call vimspector#ToggleBreakpoint()<CR>
  nnoremap  <Leader>dT :call vimspector#ClearBreakpoints()<CR>

  nmap    <Leader>dr <Plug>VimspectorRestart
  nmap    <Leader>de <Plug>VimspectorStepOut
  nmap    <Leader>di <Plug>VimspectorStepInto
  nmap    <Leader>do <Plug>VimspectorStepOver

  "" auto pairs
  au FileType html let b:AutoPairs = AutoPairsDefine({'<!--' : '-->'}, ['{'])


  "switch buffer
  nnoremap  <silent>   <tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>
  nnoremap  <silent> <s-tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR>
  
  command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument
  vmap <leader>f  <Plug>(coc-format-selected)
  nmap <leader>f  <Plug>(coc-format-selected)

"------------------------------------------------------------------------------
" slime configuration 
"------------------------------------------------------------------------------
" always use tmux
let g:slime_target = 'tmux'

" fix paste issues in ipython
let g:slime_python_ipython = 1

" always send text to the top-right pane in the current tmux tab without asking
let g:slime_default_config = {
            \ 'socket_name': get(split($TMUX, ','), 0),
            \ 'target_pane': '{top-right}' }
let g:slime_dont_ask_default = 1

"------------------------------------------------------------------------------
" ipython-cell configuration
"------------------------------------------------------------------------------
" Keyboard mappings. <Leader> is \ (backslash) by default

" map <Leader>s to start IPython
nnoremap <Leader>s :SlimeSend1 python -m IPython --matplotlib qt<CR>

" map <Leader>r to run script
nnoremap <Leader>r :IPythonCellRun<CR>

" map <Leader>R to run script and time the execution
nnoremap <Leader>R :IPythonCellRunTime<CR>

" map <Leader>c to execute the current cell
nnoremap <Leader>c :IPythonCellExecuteCell<CR>

" map <Leader>C to execute the current cell and jump to the next cell
nnoremap <Leader>C :IPythonCellExecuteCellJump<CR>

" ap <Leader>l to clear IPython screen
nnoremap <Leader>l :IPythonCellClear<CR>

" map <Leader>x to close all Matplotlib figure windows
nnoremap <Leader>x :IPythonCellClose<CR>

" map [c and ]c to jump to the previous and next cell header
nnoremap [c :IPythonCellPrevCell<CR>
nnoremap ]c :IPythonCellNextCell<CR>

" map <Leader>h to send the current line or current selection to IPython
nmap <Leader>h <Plug>SlimeLineSend
xmap <Leader>h <Plug>SlimeRegionSend

" map <Leader>p to run the previous command
nnoremap <Leader>p :IPythonCellPrevCommand<CR>

" map <Leader>Q to restart ipython
nnoremap <Leader>Q :IPythonCellRestart<CR>

" map <Leader>d to start debug mode
nnoremap <Leader>d :SlimeSend1 %debug<CR>

" map <Leader>q to exit debug mode or IPython
nnoremap <Leader>q :SlimeSend1 exit<CR>

" map <F9> and <F10> to insert a cell header tag above/below and enter insert mode
nmap <F9> :IPythonCellInsertAbove<CR>a
nmap <F10> :IPythonCellInsertBelow<CR>a

" also make <F9> and <F10> work in insert mode
imap <F9> <C-o>:IPythonCellInsertAbove<CR>
imap <F10> <C-o>:IPythonCellInsertBelow<CR>


let g:ipython_cell_regex = 1
let g:ipython_cell_tag = '# %%( [^[].*)?'

let g:ipython_cell_cell_command = '%paste'


set clipboard+=unnamedplus 
let g:clipboard = {
  \   'name': 'xclip-xfce4-clipman',
  \   'copy': {
  \      '+': 'xclip -selection clipboard',
  \      '*': 'xclip -selection clipboard',
  \    },
  \   'paste': {
  \      '+': 'xclip -selection clipboard -o',
  \      '*': 'xclip -selection clipboard -o',
  \   },
  \   'cache_enabled': 1,
  \ }

let g:ipython_cell_update_file_variable = 1
let g:ipython_cell_send_ctrl_c = 0
let base16colorspace=256
set termguicolors

" Use ctrl-[hjkl] to select the active split!
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>
nmap <C-v> :TagbarToggle<CR>

let g:airline#extensions#tagbar#flags = 'f'

let g:tagbar_type_cpp = {
            \ 'ctagstype' : 'c++',
            \ 'kinds'     : [
                \ 'd:macros:1:0',
                \ 'p:prototypes:1:0',
                \ 'g:enums',
                \ 'e:enumerators:0:0',
                \ 't:typedefs:0:0',
                \ 'n:namespaces',
                \ 'c:classes',
                \ 's:structs',
                \ 'u:unions',
                \ 'f:functions',
                \ 'm:members:0:0',
                \ 'v:variables:0:0'
            \ ],
            \ 'sro'        : '::',
            \ 'kind2scope' : {
                \ 'g' : 'enum',
                \ 'n' : 'namespace',
                \ 'c' : 'class',
                \ 's' : 'struct',
                \ 'u' : 'union'
            \ },
            \ 'scope2kind' : {
                \ 'enum'      : 'g',
                \ 'namespace' : 'n',
                \ 'class'     : 'c',
                \ 'struct'    : 's',
                \ 'union'     : 'u'
            \ }
        \ }

 
