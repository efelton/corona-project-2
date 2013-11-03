----------------------------------------------------------------------------------
--
-- scenetemplate.lua
--
----------------------------------------------------------------------------------

local storyboard = require( "storyboard" )
local scene = storyboard.newScene()

require("navbar")

local fantasyButton, unusualButton, euroButton, ameriButton

-- function used by the navbar to move onto the selected scene
function nextScene(event)
	if event.phase == "ended" then
		storyboard.gotoScene( event.target.myname )
	end
end

-- function used by the scene to move onto a different scene for a selected category
function goCategory (event)
	if event.phase == "ended" then
		local options = {
		    params = {
	      	  category = event.target.category
  		 	}
		}
		storyboard.gotoScene( "scene2", options )
	end
end

-- Called when the scene's view does not exist:
function scene:createScene( event )
	local group = self.view

	-- create the background, header and 4 category buttons
	background = display.newImageRect ( "sceneBG.png", 320,480)
	background.x = display.contentWidth/2
	background.y = display.contentHeight/2
	group:insert(background)

	message = display.newText( "Categories", 160, 50, nil, 60 )
	message.x = display.contentWidth/2
	message.y = 100
	message:setTextColor( 34, 51, 136 )
	group:insert(message)

    fantasyButton = display.newImageRect ( "img/fantasy-category.png", 150, 30)
    fantasyButton.x = display.contentWidth/2 -80
	fantasyButton.y = display.contentHeight/2 - 40
	fantasyButton.category = 1
    group:insert(fantasyButton)

    unusualButton = display.newImageRect ( "img/unusual-category.png", 150, 30)
    unusualButton.x = display.contentWidth/2 +80
	unusualButton.y = display.contentHeight/2 - 40
	unusualButton.category = 2
    group:insert(unusualButton)

    euroButton = display.newImageRect ( "img/eurogame-category.png", 150, 30)
    euroButton.x = display.contentWidth/2 -80
	euroButton.y = display.contentHeight/2 + 0
	euroButton.category = 3
    group:insert(euroButton)

    ameriButton = display.newImageRect ( "img/ameritrash-category.png", 150, 30)
    ameriButton.x = display.contentWidth/2 +80
	ameriButton.y = display.contentHeight/2 + 0
	ameriButton.category = 4
    group:insert(ameriButton)

	-- set up the navbar
    setupNavbar(group)
end

-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
	local group = self.view

	-- add event listeners for the category buttons
	fantasyButton:addEventListener ("touch", goCategory)
	unusualButton:addEventListener ("touch", goCategory)
	euroButton:addEventListener ("touch", goCategory)
	ameriButton:addEventListener ("touch", goCategory)

	-- set up the event listeners for the navbar buttons
	setupNavbarHandlers(nextScene)
end

-- Called when scene is about to move offscreen:
function scene:exitScene( event )
	local group = self.view

	-- remove the event listeners for the category buttons	
	fantasyButton:removeEventListener ("touch", goCategory)
	unusualButton:removeEventListener ("touch", goCategory)
	euroButton:removeEventListener ("touch", goCategory)
	ameriButton:removeEventListener ("touch", goCategory)

	-- remove the handlers for the navbar buttons
	removeNavbarHandlers(nextScene)

	-- a problem with the navbar means that if the user returns to a screen with the navbar
	-- the buttons don't work; calling storyboard.removeall() works around this issue	
	storyboard.removeAll()
end


-- Called prior to the removal of scene's "view" (display group)
function scene:destroyScene( event )
	local group = self.view
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