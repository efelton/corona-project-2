----------------------------------------------------------------------------------
--
-- scenetemplate.lua
--
----------------------------------------------------------------------------------

local storyboard = require( "storyboard" )
local scene = storyboard.newScene()

require("navbar")


----------------------------------------------------------------------------------
-- 
--	NOTE:
--	
--	Code outside of listener functions (below) will only be executed once,
--	unless storyboard.removeScene() is called.
-- 
---------------------------------------------------------------------------------

---------------------------------------------------------------------------------
-- BEGINNING OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------
function nextScene(event)
	if event.phase == "ended" then
		storyboard.gotoScene( event.target.myname )
	end
end

-- Called when the scene's view does not exist:
function scene:createScene( event )
	local group = self.view

	-----------------------------------------------------------------------------
		
	--	CREATE display objects and add them to 'group' here.
	--	Example use-case: Restore 'group' from previously saved state.
	

	-----------------------------------------------------------------------------
	setupNavbar(group)
end


-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
	local group = self.view
	
	-----------------------------------------------------------------------------
		

--import the table view library
local tableView = require("tableView")

-- ui library for buttons 
local ui = require("ui") 
display.setStatusBar( display.HiddenStatusBar ) 
--initial values

local screenOffsetW, screenOffsetH = display.contentWidth -  display.viewableContentWidth, display.contentHeight - display.viewableContentHeight 
-- used for offsetting buttons
-- display.viewableContentWidth = A read-only property that contains the width of the viewable screen area in content coordinates.
-- In cases where you use scaling sometimes content is scaled where some appears off screen. Only viewable content gets considered here

local myList

local background = display.newRect(0, navbarHeight, display.contentWidth, display.contentHeight)
background:setFillColor(77, 77, 77)
group:insert(background)
 
--setup the table
local data = {}  

--setup a color fill for selected items
local selected = display.newRect(0, 0, 50, 50)  --add acolor fill to show the selected item

selected:setFillColor(67,141,241,180)  --set the color fill to light blue
selected.isVisible = false  --hide color fill until needed

--setup functions to execute on touch of the list view items
function listButtonRelease( event )
	self = event.target -- the target is the row 
	local id = self.id  -- this is the row id in the table

	print(self.data.title) -- the rows data.title
    print(self.data.subtitle) -- the rows data.subtitle
    print(self.data.image) -- the rows data.image
		
	local options =
	{
    params =
   		 {
      	  var1 = self.data.title,
      	  var2 = self.data.subtitle,
      	  var3 = self.data.image,
      	  var4 = self.data.longDescription
  		 }
	}

	storyboard.gotoScene( "scene3", options )

end

--setup each row as a new table, then add title, subtitle, and image
data[1] = {}
data[1].title = "Chaos in the Old World"
data[1].subtitle = "Multiple paths to victory"
data[1].image = "img/chaos-cover.png"
data[1].longDescription = "Finely balanced asymmetric area control game with multiple paths to victory. Play with 4 only. " ..
	"Lasts 2-3 hours. Complexity is medium."

data[2] = {}
data[2].title = "Cyclades"
data[2].subtitle = "Light conflict game with auctions"
data[2].image = "img/cyclades-cover.png"
data[2].longDescription = "Light and simple conflict game which involves auctions, greek mythology and some civ elements." ..
	"This is a surprisingly rich game that belies its simple ruleset. Very entertaining! " .. 
	"Plays best with 3 to 5. Duration is about 2 hours. Complexity is Easy." 

data[3] = {}
data[3].title = "Descent"
data[3].subtitle = "Tactical miniatures dungeoneer"
data[3].image = "img/descent-cover.png"
data[3].longDescription = "Tactical miniatures game with dungeon crawling theme. Enjoyable update on an old classic. " .. 
	"Plenty of miniatures come in the box. A drawback is that there is no hidden information so the players are rarely " ..
	"surprised. Play with 2 to 5. Duration is 2 to 3 hours. Complexity is difficult."

data[4] = {}
data[4].title = "Kemet"
data[4].subtitle = "Egyptian themed game"
data[4].image = "img/kemet-cover.png"
data[4].longDescription = "This is an Eqyptian themed conflict game which rewards aggressive play. " ..
	"The rules discourage playing defensively. Quick moving and enjoyable. Anything can happen. Very bloody. " .. 
	"Play with 2 to 5. Duration is 2-3 hours. Complexity is Medium."

data[5] = {}
data[5].title = "Merchants and Marauders"
data[5].subtitle = "Caribbean Pirates simulator"
data[5].image = "img/merchants-cover.png"
data[5].longDescription = "This is a simulation of seafaring in the Caribbean during the Age of Sail" ..
	"This is a complex and heavyweight game with a lot of planning. Full of flavour and tension. " ..
	"Play with 2 to 4. Duration is 2-4 hours. Complexity is Difficult."

data[6] = {}
data[6].title = "King of Tokyo"
data[6].subtitle = "Lightweight dice roller"
data[6].image = "img/tokyo-cover.png"
data[6].longDescription = "Quick-moving and lightweight, but thoughtful dice game. Good pick up game. Bright and Breezy. " ..
	"Play with any number from 2 to 6. Lasts 30 mins. Complexity is easy."

data[7] = {}
data[7].title = "Agricola"
data[7].subtitle = "The Farming Game"
data[7].image = "img/agricola.png"
data[7].longDescription = "Strategic minded Euro game about farming. Look after your livestock. " ..
	"Play from 2 to 5. Lasts 1 to 2 hours. Complexity is Medium."

data[8] = {}
data[8].title = "Archipelago"
data[8].subtitle = "Colonial resource production"
data[8].image = "img/archipelago.png"
data[8].longDescription = "Complex game about colonialism in the Caribbean. Interesting hidden victory condition mechanic. " ..
	" Lasts 2 to 3 hours. Complexity is Difficult."

data[9] = {}
data[9].title = "Ascending Empires"
data[9].subtitle = "Flicking space game"
data[9].image = "img/ascending-empires.png"
data[9].longDescription = "Quick moving but meaty space strategy game. Movement is accomplished by flicking counters across the board. " ..
	" Best with 4 players. Lasts 2 hours. Complexity is Easy."

data[10] = {}
data[10].title = "Ascending Empires"
data[10].subtitle = "Flicking space game"
data[10].image = "img/ascending-empires.png"
data[10].longDescription = "Game of deception, negotiation and memory. A social game with a hidden traitor mechanic. " ..
	" Plays with 5-10 players. Lasts 30 mins. Complexity is Medium."

data[10] = {}
data[10].title = "House on the Hill"
data[10].subtitle = "Horror game"
data[10].image = "img/betrayal.png"
data[10].longDescription = "Horror game with 40 different scenarios. One player becomes the traitor. " ..
	" Plays with 3-5 players. Lasts 2 hours. Complexity is Medium."

data[11] = {}
data[11].title = "Settlers of Catan"
data[11].subtitle = "Trading game"
data[11].image = "img/catan.png"
data[11].longDescription = "Classic euro-style trading game. Acquire resources to build roads and settlements. " ..
	" Plays with 3-4 players. Lasts 2 hours. Complexity is Medium."

data[12] = {}
data[12].title = "DungeonQuest"
data[12].subtitle = "Raid the dragon's hoard"
data[12].image = "img/dungeonquest.png"
data[12].longDescription = "Raid the dragon's hoard. Very low chance of survival or success. " ..
	" Plays with 1-4 players. Lasts 90 mins. Complexity is Medium."

data[13] = {}
data[13].title = "Risk: Legacy"
data[13].subtitle = "Metagame"
data[13].image = "img/legacy.png"
data[13].longDescription = "Based on the Risk boardgame. The rules and board change game to game based on player decisions. " ..
	"Make your own game. " ..
	"Plays with 2-4 players. Lasts 90 mins. Complexity is Medium."

data[14] = {}
data[14].title = "Puerto Rico"
data[14].subtitle = "Grow your plantation"
data[14].image = "img/puerto-rico.png"
data[14].longDescription = "Invest in your plantation and grow cotton and indigo. Success is based on your reputation back in Spain. " ..
	" Plays with 3-5 players. Lasts 2 hours. Complexity is Medium."

data[15] = {}
data[15].title = "Space Hulk"
data[15].subtitle = "Desperate Battle"
data[15].image = "img/space-hulk.png"
data[15].longDescription = "Man versus alien in desperate battle. The 3rd edition is a beautiful update to a classic game. " ..
	"Plays with 2 players. Lasts 2 hours. Complexity is Medium."

data[16] = {}
data[16].title = "Talisman"
data[16].subtitle = "The Magical Quest Game"
data[16].image = "img/talisman.png"
data[16].longDescription = "Seek a talisman and then the Crown of Command " ..
	"Plays with 2-6 players. Lasts 2-3 hours. Complexity is Medium."

--local topBoundary = display.screenOriginY + 40
local topBoundary = navbarHeight
local bottomBoundary = display.screenOriginY + 0

-- create the list of items

	myList = tableView.newList{
	data=data, --A table containing elements that the list can iterate through to display in each row.
	default="listItemBg.png", --An image for the row background. Defines the hit area for the touch.
	over="listItemBg_over.png", --An image that will show on touch.
	onRelease=listButtonRelease, --A function name that defines the action to take after a row is tapped.
	top=topBoundary, --The upper boundary of the list. The list will start and snap back to this position.
	bottom=bottomBoundary, --The bottom boundary of the list. The list will snap back to this position when scrolled upward.
	
	-- callback = A function that defines how to display the data in each row. Each element in the data table will be used in place of the 
    -- argument ("item")  assigned to the callback function. 
    callback = function( row ) 
                         local g = display.newGroup()

                         local img = display.newImage(row.image)
                         g:insert(img)
                         img.x = math.floor(img.width*0.5 + 6)
                         img.y = math.floor(img.height*0.5) 

                         local title =  display.newText( row.title, 0, 0, native.systemFontBold, 14 )
                         title:setTextColor(0, 0, 0)
                         g:insert(title)
                         title.x = title.width*0.5 + img.width + 6
                         title.y = 30

                         local subtitle =  display.newText( row.subtitle, 0, 0, native.systemFont, 12 )
                         subtitle:setTextColor(80,80,80)
                         g:insert(subtitle)
                         subtitle.x = subtitle.width*0.5 + img.width + 6
                         subtitle.y = title.y + title.height + 6

                         return g  


                  end 
}
group:insert(myList)

local function scrollToTop()
	myList:scrollTo(topBoundary)
end

-- --Setup the nav bar 
-- local navBar = ui.newButton{
-- 	default = "navBar.png",
-- 	onRelease = scrollToTop
-- }

-- navBar.x = display.contentWidth*.5
-- navBar.y = math.floor(display.screenOriginY + navBar.height*0.5) -- screenOriginY is used in cases like iphone 5 where borders are added to screen
-- group:insert(navBar)

-- local navHeader = display.newText("Coffee", 0, 0, native.systemFontBold, 16)
--navHeader:setTextColor(255, 255, 255)
--navHeader.x = display.contentWidth*.5
--navHeader.y = navBar.y
--group:insert(navHeader)

--Add a white background to the list.  

local listBackground = display.newRect( 0, 0, myList.width, myList.height )
listBackground:setFillColor(255,255,255)
myList:insert(1,listBackground)


	-----------------------------------------------------------------------------

setupNavbarHandlers(nextScene)	
end


-- Called when scene is about to move offscreen:
function scene:exitScene( event )
	local group = self.view
	
	-----------------------------------------------------------------------------
	
	--	INSERT code here (e.g. stop timers, remove listeners, unload sounds, etc.)
	
	-----------------------------------------------------------------------------
	removeNavbarHandlers(nextScene)
	
end


-- Called prior to the removal of scene's "view" (display group)
function scene:destroyScene( event )
	local group = self.view
	
	-----------------------------------------------------------------------------
	
	--	INSERT code here (e.g. remove listeners, widgets, save state, etc.)
	
	-----------------------------------------------------------------------------
	
end


---------------------------------------------------------------------------------
-- END OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------

-- "createScene" event is dispatched if scene's view does not exist
scene:addEventListener( "createScene", scene )

-- "enterScene" event is dispatched whenever scene transition has finished
scene:addEventListener( "enterScene", scene )

-- "exitScene" event is dispatched before next scene's transition begins
scene:addEventListener( "exitScene", scene )

-- "destroyScene" event is dispatched before view is unloaded, which can be
-- automatically unloaded in low memory situations, or explicitly via a call to
-- storyboard.purgeScene() or storyboard.removeScene().
scene:addEventListener( "destroyScene", scene )

---------------------------------------------------------------------------------

return scene