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
	
	local params = event.params

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

	setupNavbarHandlers(nextScene)
 

	-----------------------------------------------------------------------------
	
end


-- Called when scene is about to move offscreen:
function scene:exitScene( event )
	local group = self.view
	
	removeNavbarHandlers(nextScene)
	imageHeader:removeSelf() 
	message:removeSelf()
	longMessage:removeSelf()

	storyboard.removeAll()

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