setlocal list
  set mouse=a        " Enable mouse
  set tabstop=4         "
  set shiftwidth=4      "
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
    Plug 'joshdick/onedark.vim'           " grubox


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
    Plug 'liuchengxu/vista.vim'           " Function tag bar
    Plug 'alvan/vim-closetag'             " Auto close HTML/XML tag


  " Code syntax highlight
    Plug 'yuezk/vim-js'               " Javascript
    Plug 'MaxMEllon/vim-jsx-pretty'         " JSX/React
    Plug 'jackguo380/vim-lsp-cxx-highlight'     " C++ syntax
    Plug 'uiiaoo/java-syntax.vim'

  " Source code version control
    Plug 'tpope/vim-fugitive'

  " format
  " post install (yarn install | npm install) then load plugin only for editing supported files
  Plug 'prettier/vim-prettier', {
    \ 'do': 'yarn install --frozen-lockfile --production',
    \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }

  call plug#end()


  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " => Plugin Setting
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " Set theme

  "colorscheme onedark
   " Overwrite some color highlight
  if (has("autocmd"))
    augroup colorextend
      autocmd ColorScheme
        \ * call onedark#extend_highlight("Comment",{"fg": {"gui": "#728083"}})
      autocmd ColorScheme
        \ * call onedark#extend_highlight("LineNr", {"fg": {"gui": "#728083"}})
    augroup END
  endif

  " Disable automatic comment in newline

  autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o


  " Airline Setting
  let g:airline_powerline_fonts = 1               " Enable font for status bar
  let g:airline_theme='gruvbox'                 " Theme OneDark

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
  autocmd StdinReadPre * let s:std_in=1
  autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif

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

  " vista vim
  " Show the nearest function name in status bar
  function! NearestMethodOrFunction() abort
    return get(b:, 'vista_nearest_method_or_function', '')
  endfunction
  set statusline+=%{NearestMethodOrFunction()}

  " By default vista.vim never run if you don't call it explicitly.
  "
  " If you want to show the nearest function in your statusline automatically,
  " you can add the following line to your vimrc
  autocmd VimEnter * call vista#RunForNearestMethodOrFunction()

  " How each level is indented and what to prepend.
  " This could make the display more compact or more spacious.
  " e.g., more compact: ["▸ ", ""]
  " Note: this option only works for the kind renderer, not the tree renderer.
  let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]

  " To enable fzf's preview window set g:vista_fzf_preview.
  " The elements of g:vista_fzf_preview will be passed as arguments to fzf#vim#with_preview()
  " For example:
  let g:vista_fzf_preview = ['right:50%']

  " Ensure you have installed some decent font to show these pretty symbols, then you can enable icon for the kind.
  let g:vista#renderer#enable_icon = 1

  " The default icons can't be suitable for all the filetypes, you can extend it as you wish.
  let g:vista#renderer#icons = {
  \   "function": "\uf794",
  \   "variable": "\uf71b",
  \  }


  "" auto pairs
  au FileType html let b:AutoPairs = AutoPairsDefine({'<!--' : '-->'}, ['{'])

  " prettier
  " when running at every change you may want to disable quickfix
  let g:prettier#quickfix_enabled = 0

  autocmd TextChanged,InsertLeave *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.svelte,*.yaml,*.html PrettierAsync

  "switch buffer
  nnoremap  <silent>   <tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>
  nnoremap  <silent> <s-tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR>

  source ~/.config/nvim/coc.vim
