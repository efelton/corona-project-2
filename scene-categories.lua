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

function goCategory (event)
	if event.phase == "ended" then
	print ("got here")
		local options = {
		    params = {
	      	  category = event.target.category
  		 	}
		}
	      	  print ("category = " .. event.target.category)
		storyboard.gotoScene( "scene2", options )
	--	storyboard.gotoScene( event.target.myname )
	end
end


function left (event)
	if event.phase == "ended" then
	storyboard.gotoScene( "scene3" )
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

	message = display.newText( "Categories", 160, 50, nil, 60 )
	message.x = display.contentWidth/2
	message.y = 100
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

    setupNavbar(group)
	-----------------------------------------------------------------------------
	
end


-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
	local group = self.view
	
	-----------------------------------------------------------------------------
		
	--	INSERT code here (e.g. start timers, load audio, start listeners, etc.)
	message:setTextColor( 255,0,0 )

	fantasyButton:addEventListener ("touch", goCategory)
	unusualButton:addEventListener ("touch", goCategory)
	euroButton:addEventListener ("touch", goCategory)
	ameriButton:addEventListener ("touch", goCategory)
	-----------------------------------------------------------------------------

	setupNavbarHandlers(nextScene)
end


-- Called when scene is about to move offscreen:
function scene:exitScene( event )
	local group = self.view
	
	-----------------------------------------------------------------------------
	
	--	INSERT code here (e.g. stop timers, remove listeners, unload sounds, etc.)
	
	-----------------------------------------------------------------------------
	fantasyButton:removeEventListener ("touch", goCategory)
	unusualButton:removeEventListener ("touch", goCategory)
	euroButton:removeEventListener ("touch", goCategory)
	ameriButton:removeEventListener ("touch", goCategory)

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