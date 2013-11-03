----------------------------------------------------------------------------------
-- scenetemplate.lua
----------------------------------------------------------------------------------

local storyboard = require( "storyboard" )
local scene = storyboard.newScene()

require("navbar")

-- function used by the navbar to move onto the selected scene
function nextScene(event)
	if event.phase == "ended" then
		storyboard.gotoScene( event.target.myname )
	end
end


-- Called when the scene's view does not exist:
function scene:createScene( event )
	local group = self.view

	-- set up background, about header and about text
	background = display.newImageRect ( "sceneBG.png", 320,480)
	background.x = display.contentWidth/2
	background.y = display.contentHeight/2
	group:insert(background)

	message = display.newText( "About", 160, 50, nil, 60 )
	message.x = display.contentWidth/2
	message.y = display.contentHeight *0.20
	group:insert(message)

	detailMessageText = "Blue Whimsey Games was established in 2009. It quickly went on to become one of the world's leading " ..
						"retailers of board games. We pride ourselves on our friendly and knowledgable service. From the most " ..
						"cutting edge up to date game to the hard-to-find out of print classic, we have it and can sell it to " ..
						"you for a very reasonable price."
	detailMessage = display.newText(detailMessageText, 30, 150, 260, 0, nil, 18 )
	detailMessage:setTextColor(34, 51, 136)
	group: insert(detailMessage)

	-- set up the navbar
	setupNavbar(group)
end


-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
	local group = self.view
	message:setTextColor( 34, 51, 136 )

	-- set up the event handlers for the navbar
	setupNavbarHandlers(nextScene)	
end


-- Called when scene is about to move offscreen:
function scene:exitScene( event )
	local group = self.view

	-- remove the navbar handlers	
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