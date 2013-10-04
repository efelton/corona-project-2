
----------------------------------------------------------------------------------
--
-- scenetemplate.lua
--
----------------------------------------------------------------------------------

local storyboard = require( "storyboard" )
local scene = storyboard.newScene()

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

function right (event)
	if event.phase == "ended" then
	storyboard.gotoScene( "scene-categories" )
    end
end

function goAbout (event)
	if event.phase == "ended" then
	storyboard.gotoScene( "scene-about" )
    end
end

function goContacts (event)
	if event.phase == "ended" then
	storyboard.gotoScene( "scene-contacts" )
    end
end

-- Called when the scene's view does not exist:
function scene:createScene( event )
	local group = self.view

	-----------------------------------------------------------------------------
		
	--	CREATE display objects and add them to 'group' here.
	--	Example use-case: Restore 'group' from previously saved state.
	
	background = display.newImageRect ( "sceneBG.png", 320,480)
	background.x = display.contentWidth/2
	background.y = display.contentHeight/2
	group:insert(background)

	message = display.newText( "Home", 160, 50, nil, 60 )
	message.x = display.contentWidth/2
	message.y = display.contentHeight/2
	group:insert(message)


    rightArrow = display.newImageRect ( "arrowRight.png", 60,60)
    rightArrow.x = display.contentWidth/2 + 100
	rightArrow.y = display.contentHeight/2 + 80
    group:insert(rightArrow)

    aboutArrow = display.newImageRect ( "arrowRight.png", 60,60)
    aboutArrow.x = display.contentWidth/2 + 0
	aboutArrow.y = display.contentHeight/2 + 80
    group:insert(aboutArrow)

    contactsArrow = display.newImageRect ( "arrowRight.png", 60,60)
    contactsArrow.x = display.contentWidth/2 + -100
	contactsArrow.y = display.contentHeight/2 + 80
    group:insert(contactsArrow)

	-----------------------------------------------------------------------------
	
end


-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
	local group = self.view
	
	-----------------------------------------------------------------------------
		
	--	INSERT code here (e.g. start timers, load audio, start listeners, etc.)
	message:setTextColor( 255,0,0 )

	rightArrow:addEventListener ("touch", right)
	aboutArrow:addEventListener ("touch", goAbout)
	contactsArrow:addEventListener ("touch", goContacts)
	-----------------------------------------------------------------------------
	
end


-- Called when scene is about to move offscreen:
function scene:exitScene( event )
	local group = self.view
	
	-----------------------------------------------------------------------------
	
	--	INSERT code here (e.g. stop timers, remove listeners, unload sounds, etc.)
	
	-----------------------------------------------------------------------------
	
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