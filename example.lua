
-- Use this function to perform your initial setup
function setup()
    
    --Sets Variables for the Menu Object
    pos=vec2(WIDTH/2,HEIGHT/2)
    ftSize = 60
    title="Test Title"
    titleColor = vec3(255,0,0)
    itemColor = vec3(255,255,255)
    hlColor = vec3(100,40,100)
    
    --Initializes the Menu Object
    mainMenu = HighlightMenu(pos,title,ftSize,titleColor,itemColor,hlColor)
    mainMenu:addNew("first","test1()")
    mainMenu:addNew("second","test2()")
    mainMenu:addNew("third","test3()")
    
end

-- This function gets called once every frame
function draw()
    -- This sets a dark background color 
    background(0, 0, 0, 255)
    
    --Draws the Menu
    mainMenu:draw()
    
    -- This sets the line thickness
    strokeWidth(5)
    
end

function touched(touch)
    --Handles Menu Touch Events
    mainMenu:touched(touch)
end

function test1()
    print ("Test1")
end
function test2()
    print("Test2")
end
function test3()
    print("Test3")
end