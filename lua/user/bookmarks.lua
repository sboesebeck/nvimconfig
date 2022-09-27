
local keymap = vim.keymap.set

keymap("n","<leader>mk","<cmd>BookmarkNext<CR>")
keymap("n","<leader>mj","<cmd>BookmarkPrev<CR>")
keymap("n","<leader>mx","<cmd>BookmarkClear<CR>")
keymap("n","<leader>mX","<cmd>BookmarkClearAll<CR>")
keymap("n","<leader>ma","<cmd>BookmarkAnnotate<CR>")
keymap("n","<leader>mi","<cmd>BookmarkShowAll<CR>")

--[[ nmap <Leader><Leader> <Plug>BookmarkToggle ]]
--[[ nmap <Leader>i <Plug>BookmarkAnnotate ]]
--[[ nmap <Leader>a <Plug>BookmarkShowAll ]]
--[[ nmap <Leader>j <Plug>BookmarkNext ]]
--[[ nmap <Leader>k <Plug>BookmarkPrev ]]
--[[ nmap <Leader>c <Plug>BookmarkClear ]]
--[[ nmap <Leader>x <Plug>BookmarkClearAll ]]
--[[ nmap <Leader>kk <Plug>BookmarkMoveUp ]]
--[[ nmap <Leader>jj <Plug>BookmarkMoveDown ]]
--[[ nmap <Leader>g <Plug>BookmarkMoveToLine ]]
