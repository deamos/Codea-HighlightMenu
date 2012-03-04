HighlightMenuButton = class()
--Class for each Menu Option. Called via HighlightMenu:addNew()
function HighlightMenuButton:init(txt,func,pos)
    self.txt = txt
    self.func = func --use loadstring()
    self.pos = pos
    self.selected = false
end