----------------------------------------------------------------------------------
-- scenetemplate.lua
----------------------------------------------------------------------------------

local storyboard = require( "storyboard" )
local scene = storyboard.newScene()

require("navbar")

-- function used by the navbar to move onto the selected scene
function nextScene(event)
	print("touched")
	if event.phase == "ended" then
		storyboard.gotoScene( event.target.myname )
	end
end

-- Called when the scene's view does not exist:
function scene:createScene( event )
	local group = self.view

	-- set up the background, contact header and message
	background = display.newImageRect ( "sceneBG.png", 320,480)
	background.x = display.contentWidth/2
	background.y = display.contentHeight/2
	group:insert(background)

	message = display.newText( "Contact us", 160, 50, nil, 60 )
	message.x = display.contentWidth/2
	message.y = display.contentHeight * 0.2
	message:setTextColor(34, 51, 136)
	group:insert(message)

	detailMessageText = "By Phone at (01) 555-5555 \n" ..
						"By email at service@bwg.com \n\n" ..
						"Open Monday to Saturday from 10 am to 6.30 pm" 
	detailMessage = display.newText(detailMessageText, 30, 150, 260, 0, nil, 18 )
	detailMessage:setTextColor(34, 51, 136)
	group: insert(detailMessage)

	-- set up the navbar
	setupNavbar(group)
end


-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
	local group = self.view

	-- set up the navbar handlers
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