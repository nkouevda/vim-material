set background=dark

highlight clear

if exists('syntax_on')
  syntax reset
endif

let g:colors_name = 'material'

let s:colors = {}
let s:colors.0   = [  '0', '#272822']
let s:colors.1   = [  '1', '#ff5370']
let s:colors.2   = [  '2', '#c3e88d']
let s:colors.3   = [  '3', '#ffcb6b']
let s:colors.4   = [  '4', '#82aaff']
let s:colors.5   = [  '5', '#bb80b3']
let s:colors.6   = [  '6', '#89ddff']
let s:colors.7   = [  '7', '#f8f8f2']
let s:colors.8   = [  '8', '#5d5e59']
let s:colors.237 = ['237', '#3e3d32']
let s:colors.238 = ['238', '#49483e']
let s:colors.243 = ['243', '#75715e']

" See `:help g:terminal_ansi_colors`
let s:ansi = filter(copy(s:colors), { k -> k < 8 })
let s:ansi_hex = map(copy(s:ansi), { k, v -> v[1] })
let g:terminal_ansi_colors = repeat(values(s:ansi_hex), 2)

function! s:highlight(group, fg, bg, ...)
  let l:attrs = a:0 ? a:1 : 'NONE'
  exe 'hi ' .. a:group .. ' cterm=' .. l:attrs .. ' gui=' .. l:attrs
  if a:fg != ''
    exe 'hi ' .. a:group .. ' ctermfg=' .. s:colors[a:fg][0]
    exe 'hi ' .. a:group .. ' guifg=' .. s:colors[a:fg][1]
  endif
  if a:bg != ''
    exe 'hi ' .. a:group .. ' ctermbg=' .. s:colors[a:bg][0]
    exe 'hi ' .. a:group .. ' guibg=' .. s:colors[a:bg][1]
  endif
endfunction

" General
call s:highlight('Normal', '7', '0')
call s:highlight('Visual', '', '8')
hi! link VisualNOS Visual
call s:highlight('Search', '0', '3')
call s:highlight('IncSearch', '0', '4')
call s:highlight('Folded', '243', '238')
hi! link FoldColumn Folded
call s:highlight('Cursor', '0', '7')
call s:highlight('CursorLine', '', '237')
hi! link CursorColumn CursorLine

" Splits, status lines, and tab line
call s:highlight('VertSplit', '237', '237')
call s:highlight('StatusLine', '7', '237')
call s:highlight('StatusLineNC', '243', '237')
hi! link StatusLineTerm StatusLine
hi! link StatusLineTermNC StatusLineNC
hi! link TabLine StatusLineNC
hi! link TabNum TabLine
hi! link TabWinNum TabLine
hi! link TabLineSel StatusLine
hi! link TabNumSel TabLineSel
hi! link TabWinNumSel TabLineSel
hi! link TabLineFill VertSplit

" Popup menu and command line completion menu
hi! link Pmenu StatusLine
call s:highlight('PmenuSbar', '', '238')
call s:highlight('PmenuThumb', '', '243')
call s:highlight('PmenuSel', '0', '6')
hi! link WildMenu PmenuSel

" Syntax
call s:highlight('Comment', '243', '')
call s:highlight('Constant', '4', '')
call s:highlight('String', '3', '')
hi! link Character String
call s:highlight('Identifier', '2', '')
call s:highlight('Function', '2', '')
call s:highlight('Statement', '1', '')
hi! link PreProc Statement
call s:highlight('Type', '6', '')
hi! link StorageClass Statement
hi! link Special String
call s:highlight('SpecialChar', '5', '')
hi! link Delimiter SpecialChar
call s:highlight('Underlined', '6', '', 'underline')
hi! link Ignore Comment
call s:highlight('Error', '0', '1')
hi! link Todo Search

" Spelling
hi! link SpellBad Error
call s:highlight('SpellCap', '0', '4')
hi! link SpellLocal SpellCap
hi! link SpellRare SpellCap

" Messages
hi! link ModeMsg Normal
hi! link Title Special
hi! link MoreMsg Title
hi! link WarningMsg MoreMsg
hi! link Question MoreMsg
hi! link ErrorMsg Statement

" Diff
hi! link DiffAdd Search
call s:highlight('DiffDelete', '0', '0')
hi! link DiffChange Visual
hi! link DiffText DiffAdd

" Miscellaneous
call s:highlight('MatchParen', '0', '243')
hi! link ColorColumn Error
hi! link Directory Statement
hi! link NonText Comment
hi! link Conceal NonText
hi! link SpecialKey NonText
hi! link LineNr NonText
hi! link CursorLineNr Normal
hi! link SignColumn LineNr

" Clean up
unlet s:colors s:ansi s:ansi_hex
delfunction s:highlight
