set nocompatible
set nowrap
set history=1000

"start maximized
set lines=999 columns=999

"set terminal title
set title

"indentation
filetype plugin indent on
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

"Syntastic syntax checker
let g:syntastic_enable_signs=1
let g:syntastic_auto_jump=2
"let g:syntastic_check_on_open = 1
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"
let g:syntastic_auto_loc_list=0
let g:syntastic_loc_list_height = 5
let g:syntastic_python_pylint_quiet_messages = { "regex": 
        \[
        \'multiple-statements',
        \'bad-whitespace',
        \'invalid-name',
        \'bad-continuation',
        \]}
nnoremap <F5> :w<CR>:SyntasticCheck<CR>

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

"Use TAB to complete when typing words, else inserts TABs as usual.
"Uses dictionary and source files to find matching words to complete.
"function! Tab_Or_Complete()
"  if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
"    return "\<C-N>"
"  else
"    return "\<Tab>"
"  endif
"endfunction
":inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>

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

execute pathogen#infect()
call pathogen#helptags()

"tagbar class inspector
nnoremap <F4> :TagbarToggle<CR>

"fold class
"nnoremap <F9> :set nowrapscan<CR>/class <CR>jzA:set wrapscan<CR>

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


"https://github.com/luochen1990/rainbow
"let g:rainbow_active = 1
"let g:rainbow_conf = {
"             \'guifgs': ['goldenrod', 'goldenrod', 'goldenrod', 'goldenrod'],
"    \   'ctermfgs': ['darkgray', 'darkblue', 'darkmagenta', 'darkcyan'],
"    \   'operators': '_,_',
"    \   'parentheses': [['(',')'], ['\[','\]'], ['{','}']],
"    \   'separately': {
"    \       '*': {},
"    \       'lisp': {
"    \           'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
"    \           'ctermfgs': ['darkgray', 'darkblue', 'darkmagenta', 'darkcyan', 'darkred', 'darkgreen'],
"    \       },
"    \       'vim': {
"    \           'parentheses': [['fu\w* \s*.*)','endfu\w*'], ['for','endfor'], ['while', 'endwhile'], ['if','_elseif\|else_','endif'], ['(',')'], ['\[','\]'], ['{','}']],
"    \       },
"    \       'tex': {
"    \           'parentheses': [['(',')'], ['\[','\]'], ['\\begin{.*}','\\end{.*}']],
"    \       },
"    \       'css': 0,
"    \       'stylus': 0,
"    \   }
"    \}

"https://github.com/oblitum/rainbow
au FileType c,cpp,objc,objcpp,python,sh call rainbow#load()


"MRU
let MRU_Max_Entries = 2000
let MRU_Window_Height = 15

"Startify
let g:startify_custom_footer =
    \ map(split(system('fortune | cowsay'), '\n'), '"   ". v:val') + ['','']

let g:startify_custom_header = [
            \ 'Vim cheat sheet:',
            \ 'Multicursor: Ctrl n (f=v^n^n^n...)',
            \ 'Toggle class navigator: F4',
            \ 'Align wiki table :Tabularize /||',
            \ '',
            \ ' * open new line below/above o/O',
            \ '',
            \ ' * double quote a variable ysiW" (surrounds)',
            \ '',
            \ ' * expand/shrink selection +/_',
            \ '',
            \ ' * next/prev class ][ / ]]',
            \ ' * next/prev method ]m / [m',
            \ '',
            \ ' * add/del mark m[a-zA-Z]',
            \ ' * goto mark `[a-zA-Z]',
            \ '',
            \ ' * motion word: \\w',
            \ ' * motion search char: \\s<char>',
            \ ' * :help motion.txt',
            \ ]

"vim-expand-region
call expand_region#custom_text_objects({
      \ "\/\\n\\n\<CR>": 1, 
      \ 'a]' :1,
      \ 'ab' :1,
      \ 'aB' :1,
      \ 'ii' :1,
      \ 'ai' :0,
      \ })

"Snipmate
"deps: vim-snippets, tlib_vim, vim-addon-mw-utils


"autoformat/prettyprint stuff based on filetype usign 'gq'
let format_xml="xmllint --format -"
autocmd FileType xml let &formatprg=format_xml
let format_json="python -m json.tool"
autocmd FileType json let &formatprg=format_json
let format_html="tidy -i -utf8 -ashtml"

" turn rlRun command syntax highlight on
let bl_rlRun_sub = 1
autocmd FileType html let &formatprg=format_html
