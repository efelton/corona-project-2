
local navbarWidth = display.contentWidth
local navbarPadding = 12 -- padding border of navbar
local navbarTextSize = 18 -- size of button text within navbar
local navbarHeight = navbarTextSize  + navbarPadding * 2 -- height of the navbar
local buttonSpace = 17 -- spacing between the navbar text buttons

local homeBtn

--function navButtonPress(event)
--	print (event.target.myname )
--	if event.phase == "ended" then
--			storyboard.gotoScene( event.target.myname )
--			storyboard.gotoScene( "scene-home" )
--	end
--end

function setupNavbar (group) 
	-- create the navbar
	navbarRect = display.newRect(0, 0, navbarWidth, navbarHeight)
	navbarRect:setFillColor(48, 144, 199) -- blue ivy 48, 144, 199
	group:insert(navbarRect)

	local nextTextAt = navbarPadding

	-- create the buttons
	homeButton = display.newText( "Home", nextTextAt, navbarPadding, nil, navbarTextSize )
--	print ("width = " .. homeButton.width)
	group:insert(homeButton)
	homeBtn = display.newRect (navbarPadding, navbarPadding, homeButton.width, navbarTextSize)
	homeBtn.alpha = 1
	homeBtn.myname = "scene-home"
	group:insert(homeBtn)


	nextTextAt = nextTextAt + buttonSpace + homeButton.width
	productsButton = display.newText( "Products", nextTextAt, navbarPadding, nil, navbarTextSize )
--	print ("products width = " .. productsButton.width)
	group:insert(productsButton)

	nextTextAt = nextTextAt + buttonSpace + productsButton.width
	aboutButton = display.newText( "About", nextTextAt, navbarPadding, nil, navbarTextSize )
--	print ("about width = " .. aboutButton.width)
	group:insert(aboutButton)

	nextTextAt = nextTextAt + buttonSpace + aboutButton.width
	contactButton = display.newText( "Contact", nextTextAt, navbarPadding, nil, navbarTextSize )
--	print ("contact width = " .. contactButton.width)
	group:insert(contactButton)

end

function setupNavbarHandlers (myfunc)
	print (homeBtn.myname)

	homeBtn:addEventListener("touch", myfunc)

end

