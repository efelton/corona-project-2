-- This is a reusable module that many of the scenes in this project depend upon. 
-- This provides a navigation bar at the top of the screen that provides buttons for
-- Home, Contact, About and Product categories.

-- Scenes that wish to use the navbar should call setupNavbar() in the createScene()
-- and should call setupNavbarHandlers() in the enterScene
-- and removeNavbarHandlers() in the exitScene

-- Because of the way scoping works in corona, the handlers function for changing scene
-- should be passed in to setupNavbarHandlers and removeNavbarHandlers

local navbarWidth = display.contentWidth
local navbarPadding = 12 -- padding border of navbar
local navbarTextSize = 18 -- size of button text within navbar
navbarHeight = navbarTextSize  + navbarPadding * 2 -- height of the navbar
local buttonSpace = 17 -- spacing between the navbar text buttons

local homeButton
local navBarRect, homeButtonText, homeButton, productsButtonText, productsButton, aboutButtonText, aboutButton, contactButtonText, contactButton


-- Creates the navbar and the four buttons. 
-- All assets added to the passed in display group.
function setupNavbar (group) 
	-- create the navbar
	navbarRect = display.newRect(0, 0, navbarWidth, navbarHeight)
	navbarRect:setFillColor(48, 144, 199) -- blue ivy 48, 144, 199
	group:insert(navbarRect)

	local nextTextAt = navbarPadding

	-- create the buttons
	homeButtonText= display.newText( "Home", nextTextAt, navbarPadding, nil, navbarTextSize )
	group:insert(homeButtonText)
	homeButton = display.newRect (navbarPadding, navbarPadding, homeButtonText.width, navbarTextSize)
	homeButton.isVisible = false
	homeButton.isHitTestable = true
	homeButton.myname = "scene-home"
	group:insert(homeButton)

	nextTextAt = nextTextAt + buttonSpace + homeButtonText.width
	productsButtonText = display.newText( "Products", nextTextAt, navbarPadding, nil, navbarTextSize )
	group:insert(productsButtonText)

	productsButton = display.newRect (nextTextAt, navbarPadding, productsButtonText.width, navbarTextSize)
	productsButton.isVisible = false
	productsButton.isHitTestable = true
	productsButton.myname = "scene-categories"
	group:insert(productsButton)

	nextTextAt = nextTextAt + buttonSpace + productsButtonText.width
	aboutButtonText = display.newText( "About", nextTextAt, navbarPadding, nil, navbarTextSize )
	group:insert(aboutButtonText)

	aboutButton = display.newRect (nextTextAt, navbarPadding, aboutButtonText.width, navbarTextSize)
	aboutButton.isVisible = false
	aboutButton.isHitTestable = true
	aboutButton.myname = "scene-about"
	group:insert(aboutButton)

	nextTextAt = nextTextAt + buttonSpace + aboutButtonText.width
	contactButtonText = display.newText( "Contact", nextTextAt, navbarPadding, nil, navbarTextSize )
	group:insert(contactButtonText)

	contactButton = display.newRect (nextTextAt, navbarPadding, contactButtonText.width, navbarTextSize)
	contactButton.isVisible = false
	contactButton.isHitTestable = true
	contactButton.myname = "scene-contacts"
	group:insert(contactButton)

end

function setupNavbarHandlers (myfunc)

	homeButton:addEventListener("touch", myfunc)
	productsButton:addEventListener("touch", myfunc)
	aboutButton:addEventListener("touch", myfunc)
	contactButton:addEventListener("touch", myfunc)
end

function removeNavbarHandlers (myfunc)
	homeButton:removeEventListener("touch", myfunc)
	productsButton:removeEventListener("touch", myfunc)
	aboutButton:removeEventListener("touch", myfunc)
	contactButton:removeEventListener("touch", myfunc)

end
