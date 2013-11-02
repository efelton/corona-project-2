
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
local background, message, productsButton, aboutButton, contactsButton		

function goCategories (event)
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

	logo = display.newImageRect("img/bwg-logo.png", 210, 110)
	logo.x = display.contentWidth/2
	logo.y= 100
	group:insert(logo)

    productsButton = display.newImageRect ( "img/products-button.png", 200, 50)
    productsButton.x = display.contentWidth/2
	productsButton.y = display.contentHeight/2 + 0
    group:insert(productsButton)

    aboutButton = display.newImageRect ( "img/about-button.png", 200, 50)
    aboutButton.x = display.contentWidth/2 
	aboutButton.y = display.contentHeight/2 + 65
    group:insert(aboutButton)

    contactsButton = display.newImageRect ( "img/contact-button.png", 200, 50)
    contactsButton.x = display.contentWidth/2
	contactsButton.y = display.contentHeight/2 + 130
    group:insert(contactsButton)

	-----------------------------------------------------------------------------
	
end


-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
	local group = self.view

	productsButton:addEventListener ("touch", goCategories)
	aboutButton:addEventListener ("touch", goAbout)
	contactsButton:addEventListener ("touch", goContacts)	
end


-- Called when scene is about to move offscreen:
function scene:exitScene( event )
	local group = self.view
	
	productsButton:removeEventListener("touch", goCategories)
	aboutButton:removeEventListener ("touch", goAbout)
	contactsButton:removeEventListener ("touch", goContacts)
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