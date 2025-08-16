local screenWidth, screenHeight = guiGetScreenSize()

local time = 60 -- with sc / 60 = 1 min 
local isShowing = false
-- Let's create a new browser in local mode. We will not be able to load an external URL.
local webBrowser = createBrowser(screenWidth, screenHeight, true, false)
local sound;
-- This is the function to render the browser.
function webBrowserRender()
	-- Render the browser on the full size of the screen.
	dxDrawImage(0, 0, screenWidth, screenHeight, webBrowser, 0, 0, 0, tocolor(255,255,255,255), true)
end

-- The event onClientBrowserCreated will be triggered, after the browser has been initialized.
-- After this event has been triggered, we will be able to load our URL and start drawing.
addEventHandler("onClientBrowserCreated", webBrowser, 
	function()
		if not isShowing then 
			-- After the browser has been initialized, we can load our website.
			loadBrowserURL(source, "http://mta/local/html/ls.html")

			-- Now we can start to render the browser.
			addEventHandler("onClientRender", root, webBrowserRender)

			focusBrowser(source)

			setTimer(close,30000,1)

			isShowing = true
			sound = playSound('html/assets/song.mp3')
			showCursor(true)
		end
	end
)



function close(  )
	if isShowing then 
		removeEventHandler("onClientRender", root, webBrowserRender)
		destroyElement(webBrowser)
		showCursor(false)
		isShowing = false
		stopSound(sound)
	end
end