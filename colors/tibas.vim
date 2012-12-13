"%% SiSU Vim color file
" Tibas Maintainer: Tiberio Oliveira <tiberiomoliveiraATgmailDOTcom>
" (originally looked at desert Ralph Amissah <ralph@amissah.com> (2012/04/11)
" Tibas info"{{{
:set background=dark
:highlight clear

if version > 580
 hi clear
 if exists("syntax_on")
   syntax reset
 endif
endif

let colors_name = "tibas"

if !has("gui_running") && &t_Co != 88 && &t_Co != 256
	finish
endif
"}}}

" General colors"{{{
hi Normal       guifg=#c6c6c6 guibg=#121212 gui=NONE        ctermfg=15   ctermbg=NONE cterm=NONE
hi NonText      guifg=#ff00ff guibg=#000000 gui=NONE        ctermfg=8    ctermbg=NONE cterm=NONE
                                                           
hi Cursor       guifg=#000000 guibg=#ffff00 gui=NONE        ctermfg=0    ctermbg=11   cterm=REVERSE
hi LineNr       guifg=#3a3a3a guibg=#000000 gui=NONE        ctermfg=245  ctermbg=0    cterm=NONE
                                                           
hi VertSplit    guifg=#303030 guibg=#303030 gui=NONE        ctermfg=236  ctermbg=0    cterm=REVERSE
hi StatusLine   guifg=#9cffd3 guibg=#202020 gui=NONE        ctermfg=85   ctermbg=236  cterm=BOLD
hi StatusLineNC guifg=#000000 guibg=#202020 gui=bold        ctermfg=8    ctermbg=233  cterm=NONE
                                                           
hi FoldColumn   guifg=#a8a8a8 guibg=#444444 gui=NONE        ctermfg=248  ctermbg=238  cterm=NONE
hi Folded       guifg=#a8a8a8 guibg=#444444 gui=NONE        ctermfg=248  ctermbg=238  cterm=NONE

hi Title        guifg=#5f87d7 guibg=NONE    gui=BOLD,ITALIC ctermfg=67   ctermbg=NONE cterm=BOLD
hi Visual       guifg=NONE    guibg=#262D51 gui=NONE        ctermfg=NONE ctermbg=237  cterm=NONE
                                                           
hi SpecialKey   guifg=#4e4e4e guibg=#000000 gui=NONE        ctermfg=239  ctermbg=0    term=NONE
                                                           
hi WildMenu     guifg=#008700 guibg=#ffff00 gui=NONE        ctermfg=28   ctermbg=11   cterm=NONE
hi PmenuSbar    guifg=#000000 guibg=#ffffff gui=NONE        ctermfg=0    ctermbg=15   cterm=NONE

hi Error        guifg=#ffffff guibg=#870000 gui=BOLD        ctermfg=15   ctermbg=88   cterm=BOLD
hi link ErrorMsg Error
hi WarningMsg   guifg=#ffffff guibg=#ff5f5f gui=BOLD        ctermfg=15   ctermbg=202  cterm=BOLD
                                                            
hi Directory     guifg=#ffff87 guibg=NONE    gui=NONE        ctermfg=228  ctermbg=NONE cterm=NONE
hi LocalVariable guifg=#875f87 guibg=NONE    gui=NONE        ctermfg=96   ctermbg=NONE cterm=NONE
hi Question      guifg=#87afff guibg=NONE    gui=NONE        ctermfg=111  ctermbg=NONE cterm=NONE

" Message displayed in lower left, such as --INSERT--
hi ModeMsg       guifg=#000000 guibg=#8787ff gui=BOLD        ctermfg=16    ctermbg=2 cterm=BOLD
"}}}
" Vim 7.x specific colors"{{{
if version >= 700
  hi CursorLine   guifg=NONE    guibg=#000000 gui=NONE      ctermfg=NONE ctermbg=16  cterm=NONE
  hi CursorColumn guifg=NONE    guibg=#000000 gui=NONE      ctermfg=NONE ctermbg=16  cterm=NONE
  hi MatchParen   guifg=#afff00 guibg=#af00ff gui=BOLD      ctermfg=16   ctermbg=11  cterm=BOLD
  hi Pmenu        guifg=#e5e5e5 guibg=#444444 gui=NONE      ctermfg=7    ctermbg=238 cterm=NONE
  hi PmenuSel     guifg=#000000 guibg=#d7d787 gui=NONE      ctermfg=0    ctermbg=186 cterm=NONE
  hi Search       guifg=#d787d7 guibg=#5f005f gui=UNDERLINE ctermfg=236  ctermbg=39  cterm=UNDERLINE
endif

hi IncSearch      guifg=#1c1c1c guibg=#00d7ff gui=NONE      ctermfg=234  ctermbg=45  cterm=NONE
"}}}
" Syntax highlighting"{{{
hi Comment      guifg=#585858 guibg=NONE    gui=ITALIC         ctermfg=240 ctermbg=NONE cterm=NONE

hi Constant     guifg=#d75f5f guibg=NONE    gui=BOLD,ITALIC    ctermfg=166 ctermbg=NONE cterm=BOLD
hi String       guifg=#afaf5f guibg=NONE    gui=NONE           ctermfg=226 ctermbg=NONE cterm=NONE
hi link Character String
hi Number       guifg=#af5f00 guibg=NONE    gui=NONE           ctermfg=130 ctermbg=NONE cterm=NONE
hi Boolean      guifg=#5fafd7 guibg=NONE    gui=NONE           ctermfg=74  ctermbg=NONE cterm=NONE
hi link Float     Number

hi Identifier   guifg=#8787d7 guibg=NONE    gui=BOLD           ctermfg=100 ctermbg=NONE cterm=BOLD
hi Function     guifg=#d78787 guibg=NONE    gui=BOLD           ctermfg=33  ctermbg=NONE cterm=BOLD

hi Statement    guifg=#87af5f guibg=NONE    gui=ITALIC         ctermfg=114 ctermbg=NONE cterm=NONE
hi Conditional  guifg=#ffd75f guibg=NONE    gui=BOLD           ctermfg=40  ctermbg=NONE cterm=BOLD
hi Repeat       guifg=#ffaf87 guibg=NONE    gui=BOLD           ctermfg=64  ctermbg=NONE cterm=BOLD
hi Label        guifg=#ff5fd7 guibg=NONE    gui=BOLD           ctermfg=58  ctermbg=NONE cterm=BOLD
hi Operator     guifg=#87d7d7 guibg=NONE    gui=BOLD           ctermfg=116 ctermbg=NONE cterm=BOLD
hi Keyword      guifg=#ffaf00 guibg=NONE    gui=ITALIC         ctermfg=214 ctermbg=NONE cterm=BOLD
hi Exception    guifg=#d75f87 guibg=NONE    gui=NONE           ctermfg=196 ctermbg=NONE cterm=NONE

hi PreProc      guifg=#00afd7 guibg=NONE    gui=NONE           ctermfg=38  ctermbg=NONE cterm=BOLD
hi Include      guifg=#00afaf guibg=NONE    gui=NONE           ctermfg=37  ctermbg=NONE cterm=NONE
hi Define       guifg=#d78787 guibg=NONE    gui=NONE           ctermfg=54  ctermbg=NONE cterm=NONE
hi link Macro            Define
hi link PreCondit        Define

hi Type         guifg=#d78700 guibg=NONE    gui=BOLD,ITALIC    ctermfg=172 ctermbg=NONE cterm=BOLD
hi StorageClass guifg=#c59f6f guibg=NONE    gui=BOLD           ctermfg=215 ctermbg=NONE cterm=BOLD
hi Structure    guifg=#6f9fc5 guibg=NONE    gui=BOLD           ctermfg=208 ctermbg=NONE cterm=BOLD
hi Typedef      guifg=#7fafd5 guibg=NONE    gui=BOLD           ctermfg=94  ctermbg=NONE cterm=BOLD

hi Special      guifg=#5faf00 guibg=NONE    gui=NONE           ctermfg=7  ctermbg=NONE cterm=NONE
hi link SpecialChar      Tag
hi Tag          guifg=#5fdf87 guibg=NONE    gui=NONE           ctermfg=78  ctermbg=NONE cterm=NONE
hi Delimiter    guifg=#5fafd7 guibg=NONE    gui=NONE           ctermfg=74  ctermbg=NONE cterm=NONE
hi link SpecialComment   Tag
hi link Debug            Tag

hi Ignore       guifg=#bcbcbc guibg=NONE    gui=NONE           ctermfg=250 ctermbg=NONE cterm=NONE

hi Todo         guifg=#87005f guibg=#ffff5f gui=BOLD,UNDERLINE ctermfg=89  ctermbg=227  cterm=BOLD

hi link MoreMsg          Ignore
hi link DefinedName      Ignore
hi link EnumerationName  Ignore
hi link EnumerationValue Ignore
hi link Union            Ignore
hi link VisualNOS        Ignore
"}}}
" VimDiff colors"{{{
hi DiffAdd    guifg=#bcbcbc guibg=#005f00 gui=NONE   ctermfg=250 ctermbg=22  cterm=NONE
hi DiffChange guifg=#bcbcbc guibg=#875fd7 gui=ITALIC ctermfg=250 ctermbg=98  cterm=NONE
hi DiffDelete guifg=#d7afff guibg=#870000 gui=NONE   ctermfg=183 ctermbg=88  cterm=NONE
hi DiffText   guifg=#080808 guibg=#ff5fff gui=BOLD   ctermfg=232 ctermbg=207 cterm=BOLD
"}}}
" Spelling"{{{
hi SpellBad     guisp=#d70000       ctermfg=0     ctermbg=160       gui=undercurl cterm=REVERSE
hi SpellCap     guisp=#00afd7       ctermfg=0     ctermbg=38        gui=undercurl cterm=REVERSE
hi SpellErrors  guisp=#0000d7       ctermfg=8     ctermbg=1         gui=undercurl cterm=REVERSE
hi SpellRare    guisp=#5faf00       ctermfg=0     ctermbg=70        gui=undercurl cterm=REVERSE
hi SpellLocal   guisp=#d7af00       ctermfg=0     ctermbg=178       gui=undercurl cterm=REVERSE
"}}}
" Ctags"{{{
hi link CTagsClass            htmlString
hi link CTagsGlobalConstant   htmlString
hi link CTagsGlobalVariable   htmlString
hi link CTagsImport           htmlString
hi link CTagsMember           htmlString
hi link CTagsDefinedName      htmlString
hi link CTagsEnumerationValue htmlString
hi link CTagsFunction         htmlString
hi link CTagsEnumerationName  htmlString
hi link CTagsConstant         htmlString
hi link CTagsLocalVariable    htmlString
hi link CTagsNamespace        htmlString
hi link CTagsFunction         htmlString
hi link CTagsStructure        htmlString
hi link CTagsType             htmlString
hi link CTagsUnion            htmlString
hi link CTagsExtern           htmlString
hi link CTagsFile             htmlString
"}}}
" Special for HTML"{{{
hi htmlH1      guifg=#00afd7 guibg=NONE gui=UNDERLINE ctermfg=38  ctermbg=NONE cterm=BOLD,UNDERLINE
hi htmlLink    guifg=#d7d75f guibg=NONE gui=NONE      ctermfg=185 ctermbg=NONE cterm=NONE
hi htmlString  guifg=#87875f guibg=NONE gui=NONE      ctermfg=51  ctermbg=NONE cterm=NONE
hi htmlTagName guifg=#d7afd7 guibg=NONE gui=NONE      ctermfg=15  ctermbg=NONE cterm=BOLD
hi link htmlTag    Keyword
hi link htmlEndTag Identifier
hi link htmlH2     htmlH1
hi link htmlH3     htmlH1
hi link htmlH4     htmlH1
"}}}
