call plug#begin('~/.config/nvim/plugApp')
Plug 'junegunn/vim-easy-align'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdcommenter'
Plug 'morhetz/gruvbox'
"Plug 'ctrlpvim/ctrlp.vim'
Plug 'voldikss/vim-floaterm'
Plug 'pechorin/any-jump.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'ggandor/leap.nvim'
Plug 'dracula/vim', { 'name': 'dracula' }
Plug 'preservim/tagbar'
Plug 'rust-lang/rust.vim'
"括号配对
Plug 'jiangmiao/auto-pairs'
"文件结构
Plug 'preservim/tagbar'
"快速注释
Plug 'tpope/vim-commentary'

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

call plug#end()

set termencoding=utf-8
set encoding=utf-8
set number
"if has("multi_byte")
" UTF-8 编码
set encoding=utf-8
set termencoding=utf-8
set formatoptions+=mM
set fencs=utf-8,gbk
"显示行号
set nu
syntax enable
map <F3> :NERDTreeToggle<CR>
nmap tt :FloatermNew<CR>
"nmap tt :term<CR>
imap jk <ESC>
set laststatus=2  "永远显示状态栏
let g:airline_powerline_fonts = 1  " 支持 powerline 字体
let g:airline#extensions#tabline#enabled = 1 "显示窗口tab和buffer
let g:airline_theme='bubblegum'  " murmur配色不错


if !exists('g:airline_symbols')
let g:airline_symbols = {}
endif
let g:airline_left_sep = '▶'
let g:airline_left_alt_sep = '❯'
let g:airline_right_sep = '◀'
let g:airline_right_alt_sep = '❮'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
"let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } 

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1
" 设置字体 
set guifont=Powerline_Consolas:h14:cANSI
" 设置中文提示
"language messages zh_CN.utf-8 
" 设置中文帮助
set helplang=cn
colorscheme dracula

" don't show the help in normal mode
let g:Lf_HideHelp = 1
let g:Lf_UseCache = 0
let g:Lf_UseVersionControlTool = 0
let g:Lf_IgnoreCurrentBufferName = 1
" popup mode
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2", 'font': "DejaVu Sans Mono for Powerline" }
let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0 }

let g:Lf_ShortcutF = "<leader>ff"
noremap <leader>fb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
noremap <leader>fm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
noremap <leader>ft :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
noremap <leader>fl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>

noremap <C-B> :<C-U><C-R>=printf("Leaderf! rg --current-buffer -e %s ", expand("<cword>"))<CR>
noremap <C-F> :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR>
" search visually selected text literally
xnoremap gf :<C-U><C-R>=printf("Leaderf! rg -F -e %s ", leaderf#Rg#visual())<CR>
noremap go :<C-U>Leaderf! rg --recall<CR>
let g:deoplete#enable_at_startup = 1

let Tlist_Ctags_Cmd='/usr/bin/ctags'
nnoremap <leader>t :TagbarToggle<cr>
nnoremap <C-t> :TagbarToggle<cr>
" should use `Leaderf gtags --update` first
let g:Lf_GtagsAutoGenerate = 0
let g:Lf_Gtagslabel = 'native-pygments'
noremap <leader>fr :<C-U><C-R>=printf("Leaderf! gtags -r %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fd :<C-U><C-R>=printf("Leaderf! gtags -d %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fo :<C-U><C-R>=printf("Leaderf! gtags --recall %s", "")<CR><CR>
noremap <leader>fn :<C-U><C-R>=printf("Leaderf gtags --next %s", "")<CR><CR>
noremap <leader>fp :<C-U><C-R>=printf("Leaderf gtags --previous %s", "")<CR><CR>


"跳转
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

"Quick toggle terminal.
"Plug 'PangPangPangPangPang/vim-terminal'
"map <silent> <F12> :VSTerminalToggle<cr>
"if has('nvim')
"    tnoremap <F12> <C-\><C-n> :VSTerminalToggle<cr>
"    tnoremap <C-w> <C-\><C-n><C-w>
"else
"       tmap <silent> <F12> <c-w>:VSTerminalToggle<cr>
"endif
"let g:vs_terminal_custom_height = 10
" 设置 leader 键，例子为空号键，也可以设置为其他的 默认为"/"
let mapleader=" "
let g:any_jump_disable_default_keybindings = 1
" Normal mode: Jump to definition under cursor
 nnoremap <leader>j :AnyJump<CR>

 " Visual mode: jump to selected text in visual mode
 xnoremap <leader>j :AnyJumpVisual<CR>

 " Normal mode: open previous opened file (after jump)
 nnoremap <leader>ab :AnyJumpBack<CR>

 " Normal mode: open last closed search window again
 nnoremap <leader>al :AnyJumpLastResults<CR>

 nnoremap <leader>f :Files<CR>

 " Find files using Telescope command-line sugar.
 
nnoremap <leader>ff <cmd>Telescope find_files<cr>
 
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
 
nnoremap <leader>fb <cmd>Telescope buffers<cr>
 
nnoremap <leader>fh <cmd>Telescope help_tags<cr>01~

"lua require('leap').add_default_mappings()
nmap <F8> :TagbarToggle<CR>
set autochdir
set tags=tags;

"colorscheme gruvbox
set background=dark
highlight Normal guibg=NONE ctermbg=None
set tabstop=4
set sw=4
set noexpandtab
%retab!
