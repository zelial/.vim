set nocompatible
set nowrap
set history=1000

"set terminal title
set title

"indentation
filetype plugin indent on
set autoindent
set smartindent
set shiftwidth=4
"pri odsazovani pomoci < a > zaokrouhluj na nasobky shiftwidthu
set shiftround
"velikost tabu v mezerach
set tabstop=4
set expandtab

"keep selection for repeated indenting
vnoremap < <gv
vnoremap > >gv

"quick command from insert mode, one less key to press
inoremap <C-O> <C-O>:

syntax on
set hlsearch
set incsearch

"by se swapaky davaly tam, kam slunce nesviti( a kde me nebudou strasit....)
set directory=~/tmp,.,/tmp

"wildmenu je takova cursed ficura pri tabovani souboru
set wildmenu
"takhle se to chova jako v shellu: doplni co jde a ukaze moznosti
set wildmode=list:longest

"nastaveni statuslajny (ten modry radek dole)
set laststatus=2

"skace na levou zavorku pri psani prave
set showmatch

"skroluje se pri priblizeni kurzoru ke kraji a ne az pri dosazeni okraje
set scrolloff=5
"to same horizontalne
set sidescroll=5

"u dlouhych radku se ukaze aspon zacatky misto @
set display=lastline

"co vsechno umi mazat backspace
set backspace=indent,eol,start

"zvyraznovani odpodivajici zavory do dvojice
"highlight MatchParen NONE
highlight MatchParen term=standout cterm=bold,underline

"quoting word or selection
nnoremap <C-x>" ciW"<C-r>""<Esc>
nnoremap <C-x>' ciW'<C-r>"'<Esc>
vnoremap <C-x>" c"<C-r>""<Esc>
vnoremap <C-x>' c'<C-r>"'<Esc>
inoremap <C-x>" <Esc>ciW"<C-r>""
inoremap <C-x>' <Esc>ciW'<C-r>"'
set mouse=a

"for shift-L/Rclick searching
set mousemodel=extend
cabbrev W w
cabbrev Q q

"folding
"default is all unfolded
set foldenable
set foldmethod=indent
set foldlevel=10
set foldnestmax=10


"english spellchecking
setlocal spell spelllang=en_us

"set guifont=Liberation\ Mono\ 9
set guifont=Monospace\ 12

"where to look for tags (./ is for file's dir, no './' is for vim's cwd)
set tags=./tags,./TAGS,tags,TAGS,/home/zelial/tags
set complete=.,w,b,u,t,i,k,]
"rhtslib doplnovani
set dictionary=/usr/share/rhts-library/dictionary.vim 

"will set cwd to dir of currently edited file (good for local tag files)
set autochdir

"run code via conque plugin
"autocmd FileType python :map <F2> :ConqueTermVSplit python %:p<CR>
"autocmd FileType sh :map <F2> :ConqueTermVSplit bash %:p<CR>
:map <F2> :ConqueTermVSplit bash <CR>

"run edited code (Ctrl-x e)
"nnoremap <C-x>e :w<CR>:!bash % <CR>


"the usual selection pasting shortcuts
inoremap <S-Insert> <ESC>"*pi
cnoremap <S-Insert> <C-R>*
"ve visual modu pri stisku p nahrad vyber obsahem schranky
vnoremap p <Esc>:let current_reg = @"<CR>gvdi<C-R>=current_reg<CR><Esc>

"calculator (bc-compatible formula in selection or on current line)
vmap gbc ygvPPgv:!bc -l<CR>
nmap gbc :.!bc -l<CR>

"show trailing whitespace and tabs
set listchars=tab:>-,trail:·
set list

" y and d put stuff into system clipboard (so that other apps can see it)
set clipboard=unnamed

"different background for lines longer than 80 chars
"highlight OverLength ctermbg=red ctermfg=white guibg=#FFDDDD
"match OverLength /\%81v.\+/

"highlight column under cursor for easier indentation in python
"au BufRead,BufNewFile *.py,*pyw set cursorcolumn

"velocity highlighting 
"au BufNewFile,BufRead polarion* set ft=velocity
"(actualy looks better as clojure)
au BufNewFile,BufRead polarion* set ft=clojure

"navigate between tabs/windows
map <C-S-Tab> <Esc>:tabprev<CR>
map <C-Tab> <Esc>:tabnext<CR>

" native plugi nmanagement
packloadall

"tagbar class inspector
nnoremap <F4> :TagbarToggle<CR>

"open list of revisions automatically after git log
command Glog2 :silent Glog | copen

"run curent code in pudb debugger (save first)
nnoremap <F3> :up<CR>:!gnome-terminal --maximize --command="pudb %:p"
"insert trace above current line so one 'c' in pudb will get us there
nnoremap <S-F3> Iimport pudb;pudb.set_trace()<CR><ESC>
inoremap <S-F3> <ESC>Iimport pudb;pudb.set_trace()<CR>


"coloring, scheme only tuned for gvim
colorscheme zelial
:map <F12> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
:syn match Braces display '[{}()\[\]]'
:hi Braces guifg=red

"MRU
let MRU_Max_Entries = 2000
let MRU_Window_Height = 15

"autoformat/prettyprint stuff based on filetype usign 'gqq'
let format_xml="xmllint --format -"
autocmd FileType xml let &formatprg=format_xml
let format_json="python -m json.tool"
autocmd FileType json let &formatprg=format_json
let format_html="tidy -i -utf8 -ashtml"

" turn rlRun command syntax highlight on
let bl_rlRun_sub = 1
autocmd FileType html let &formatprg=format_html

" Python linting etc
let g:ale_linters = { "python": ["ruff"] }
let g:ale_fixers = { "python": ["black", "ruff"]}

" Vundle
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'Valloric/YouCompleteMe'
Plugin 'yegappan/mru'
Plugin 'dense-analysis/ale'
Plugin 'Yggdroot/indentLine'
Plugin 'liuchengxu/vim-which-key'
Plugin 'pearofducks/ansible-vim'

let MRU_Max_Entries = 1000

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
