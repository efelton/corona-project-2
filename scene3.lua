----------------------------------------------------------------------------------
--
-- scenetemplate.lua
--
----------------------------------------------------------------------------------

local storyboard = require( "storyboard" )
local scene = storyboard.newScene()

require("navbar")

-- function for the navbar to change the scene to the one selected
function nextScene(event)
	if event.phase == "ended" then
		storyboard.gotoScene( event.target.myname )
	end
end

-- Called when the scene's view does not exist:
function scene:createScene( event )
	local group = self.view

	-- set up the navbar
	setupNavbar(group)
end


-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
	local group = self.view
	
	local params = event.params

	-- set up the imageHeader, message and longMessage
	imageHeader = display.newImage(params.var3)
	imageHeader.x = display.contentWidth *0.5
	imageHeader.y = display.contentHeight * 0.3
	group:insert(imageHeader)

    message = display.newText( params.var1, 160, 50, nil, 20 )
	message.x = display.contentWidth/2
	message.y = display.contentHeight * 0.45
	group:insert(message)

	longMessage = display.newText (params.var4, 160, display.contentHeight * 0.55, 280, 0, nil, 18)
	longMessage.x = display.contentWidth/2
	group:insert(longMessage)

	-- set up the event listeners for the navbar
	setupNavbarHandlers(nextScene)
end


-- Called when scene is about to move offscreen:
function scene:exitScene( event )
	local group = self.view

	-- remove up the event listeners for the navbar
	removeNavbarHandlers(nextScene)

	-- delete the details for the selected item to make room for the next one selected
	imageHeader:removeSelf() 
	message:removeSelf()
	longMessage:removeSelf()

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