HighlightMenu = class()

--Initializes the Menu Object
function HighlightMenu:init(pos,title,ftSize,titleColor,itemColor,hlColor)
    -- you can accept and set parameters here
    self.menuItems = {}
    self.title = title
    self.pos = vec2(pos.x,pos.y+ftSize)
    self.nextButtonPos = pos
    self.titleColor = titleColor
    self.itemColor = itemColor
    self.hlColor = hlColor
    self.ftSize=ftSize
end

--Call to draw the Title and all added Menu Buttons
function HighlightMenu:draw()
    --Draws the Title
    pushStyle()
    fontSize(self.ftSize + 15)
    fill(self.titleColor.x,self.titleColor.y,self.titleColor.z)
    text(self.title,self.pos.x,self.pos.y+self.ftSize)
    popStyle()
        
    --Draws each Menu Option and handles highlighting
    for i,button in ipairs(self.menuItems) do
        pushStyle()
        fontSize(self.ftSize)
        if button.selected == true then
            fill(self.hlColor.x,self.hlColor.y,self.hlColor.z)
        elseif button.selected == false then
            fill(self.itemColor.x,self.itemColor.y,self.itemColor.z)
        end  
        text(button.txt,button.pos.x,button.pos.y)
        popStyle()
    end
        
end

--Used to isolate the "Pass as Reference" problem with Objects
function HighlightMenu:getNewButtonPos()
    local conversionX = self.nextButtonPos.x
    local conversionY = self.nextButtonPos.y
    return vec2(conversionX,conversionY)
end

--Determines Touch Location and sets a Button's "selected" state
function HighlightMenu:touched(touch)
    if touch.state == BEGAN or touch.state == MOVING then
        for i,button in ipairs(self.menuItems) do
            if math.abs(button.pos.x - touch.x) <= self.ftSize*2 and math.abs(button.pos.y - touch.y) <= self.ftSize/2 then
                button.selected = true
            else 
                button.selected = false
            end
        end
    elseif touch.state == ENDED then
        for k,button in ipairs(self.menuItems) do
            if button.selected == true then
                exec=loadstring(button.func)
                exec()
            end
            button.selected = false
        end
    end
end

--Creates a new Menu option and appends it to the MenuOptions table
function HighlightMenu:addNew(txt,func)
    local buttonPos = self:getNewButtonPos()
    newButton = HighlightMenuButton(txt,func,buttonPos)
    table.insert(self.menuItems,newButton)
    self.nextButtonPos.y = self.nextButtonPos.y - self.ftSize
end