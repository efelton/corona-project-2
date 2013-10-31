
local navbarWidth = display.contentWidth
local navbarPadding = 12 -- padding border of navbar
local navbarTextSize = 18 -- size of button text within navbar
navbarHeight = navbarTextSize  + navbarPadding * 2 -- height of the navbar
local buttonSpace = 17 -- spacing between the navbar text buttons

local homeButton

function setupNavbar (group) 
	-- create the navbar
	navbarRect = display.newRect(0, 0, navbarWidth, navbarHeight)
	navbarRect:setFillColor(48, 144, 199) -- blue ivy 48, 144, 199
	group:insert(navbarRect)

	local nextTextAt = navbarPadding

	-- create the buttons
	homeButtonText= display.newText( "Home", nextTextAt, navbarPadding, nil, navbarTextSize )
--	print ("width = " .. homeButtonText.width)
	group:insert(homeButtonText)
	homeButton = display.newRect (navbarPadding, navbarPadding, homeButtonText.width, navbarTextSize)
	homeButton.isVisible = false
	homeButton.isHitTestable = true
	homeButton.myname = "scene-home"
	group:insert(homeButton)

	nextTextAt = nextTextAt + buttonSpace + homeButtonText.width
	productsButtonText = display.newText( "Products", nextTextAt, navbarPadding, nil, navbarTextSize )
--	print ("products width = " .. productsButtonText.width)
	group:insert(productsButtonText)

	productsButton = display.newRect (nextTextAt, navbarPadding, productsButtonText.width, navbarTextSize)
	productsButton.isVisible = false
	productsButton.isHitTestable = true
	productsButton.myname = "scene-categories"
	group:insert(productsButton)

	nextTextAt = nextTextAt + buttonSpace + productsButtonText.width
	aboutButtonText = display.newText( "About", nextTextAt, navbarPadding, nil, navbarTextSize )
--	print ("about width = " .. aboutButtonText.width)
	group:insert(aboutButtonText)

	aboutButton = display.newRect (nextTextAt, navbarPadding, aboutButtonText.width, navbarTextSize)
	aboutButton.isVisible = false
	aboutButton.isHitTestable = true
	aboutButton.myname = "scene-about"
	group:insert(aboutButton)

	nextTextAt = nextTextAt + buttonSpace + aboutButtonText.width
	contactButtonText = display.newText( "Contact", nextTextAt, navbarPadding, nil, navbarTextSize )
--	print ("contact width = " .. contactButtonText.width)
	group:insert(contactButtonText)

	contactButton = display.newRect (nextTextAt, navbarPadding, contactButtonText.width, navbarTextSize)
	contactButton.isVisible = false
	contactButton.isHitTestable = true
	contactButton.myname = "scene-contacts"
	group:insert(contactButton)

end

function setupNavbarHandlers (myfunc)
	print (homeButton.myname)

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


