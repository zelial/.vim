"%% SiSU Vim color file
"based on (stolen from):
" Slate Maintainer: Ralph Amissah <ralph@amissah.com>
" edited to induce the retro DOSich vibe
"
" check :help highlight-groups and :help group-name to see available groups
"
:set background=dark
:highlight clear
if version > 580
 hi clear
 if exists("syntax_on")
 syntax reset
 endif
endif
"define new class for braces
:syn match Braces display '[{}()\[\]]'
let colors_name = "zelial"
:hi Normal guifg=White guibg=#182730
:hi Cursor guibg=#8877cc guifg=LightGrey
:hi Braces guifg=SpringGreen guibg=SpringGreen
:hi VertSplit guibg=#c2bfa5 guifg=Grey40 gui=none cterm=reverse
:hi Folded guibg=Black guifg=Grey40 ctermfg=Grey ctermbg=DarkGrey
:hi FoldColumn guibg=Black guifg=Grey20 ctermfg=4 ctermbg=7
:hi IncSearch guifg=Green guibg=Black cterm=none ctermfg=Yellow ctermbg=Green
:hi ModeMsg guifg=Goldenrod cterm=none ctermfg=Brown
:hi MoreMsg guifg=SeaGreen ctermfg=DarkGreen
:hi NonText guifg=RoyalBlue guibg=Grey15 cterm=bold ctermfg=blue
:hi Question guifg=SpringGreen ctermfg=green
:hi Search guibg=OliveDrab guifg=Wheat cterm=none ctermfg=Grey ctermbg=Blue
:hi SpecialKey guifg=YellowGreen ctermfg=DarkGreen
:hi StatusLine guibg=#c2bfa5 guifg=Black gui=none cterm=bold,reverse
:hi StatusLineNC guibg=#c2bfa5 guifg=Grey40 gui=none cterm=reverse
:hi Title guifg=gold gui=bold cterm=bold ctermfg=Yellow
:hi Statement guifg=Goldenrod ctermfg=LightBlue
:hi Visual gui=none guifg=Khaki guibg=DarkGreen cterm=reverse
:hi WarningMsg guifg=Salmon ctermfg=1
:hi String guifg=#bf8fcf ctermfg=DarkCyan
:hi Comment term=bold guifg=SkyBlue ctermfg=11
:hi Constant guifg=LightMagenta ctermfg=Brown
:hi Special guifg=DarkKhaki ctermfg=Brown
:hi Identifier guifg=Gray80 ctermfg=Red
:hi Include guifg=Salmon ctermfg=DarkRed
:hi PreProc guifg=white ctermfg=Red
:hi Operator guifg=Salmon ctermfg=DarkRed
:hi Define guifg=Goldenrod gui=bold ctermfg=Yellow
:hi Macro guifg=Goldenrod gui=bold ctermfg=Yellow
:hi Type guifg=CornflowerBlue ctermfg=2
:hi Function guifg=SteelBlue1 ctermfg=Brown
:hi XmlTagName guifg=SteelBlue1 ctermfg=Brown
:hi XmlEndTag guifg=SteelBlue1 ctermfg=Brown
:hi pythonBuiltin guifg=Gray80 ctermfg=Brown
:hi Structure guifg=SteelBlue1 ctermfg=Green
:hi LineNr guifg=Grey50 ctermfg=3
:hi Ignore guifg=Grey40 cterm=bold ctermfg=7
:hi Todo guifg=DarkRed guibg=Gold
:hi Directory ctermfg=DarkCyan
:hi ErrorMsg cterm=bold guifg=White guibg=Red cterm=bold ctermfg=7 ctermbg=1
:hi VisualNOS cterm=bold,underline
:hi WildMenu guifg=Red guibg=Green ctermfg=0 ctermbg=3
:hi DiffAdd ctermbg=4
:hi DiffChange ctermbg=5
:hi DiffDelete cterm=bold ctermfg=4 ctermbg=6
:hi DiffText cterm=bold ctermbg=1
:hi Underlined cterm=underline ctermfg=5
:hi Error guifg=White guibg=Red cterm=bold ctermfg=7 ctermbg=1
:hi SpellErrors guifg=White guibg=Red cterm=bold ctermfg=7 ctermbg=1
:hi Pmenu guifg=White guibg=DeepSkyBlue4 ctermfg=11
