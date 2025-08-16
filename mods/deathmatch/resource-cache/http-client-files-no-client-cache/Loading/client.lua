
function scriptLoadSucess ()
    local screenWidth, screenHeight = guiGetScreenSize()
    initBrowser = guiCreateBrowser(0, 0, screenWidth, screenHeight, true, false, false)
    theBrowser = guiGetBrowser(initBrowser)
    addEventHandler("onClientBrowserCreated", initBrowser, loginScreenPanel)
end
setTimer(scriptLoadSucess, 800, 1)

function loginScreenPanel ()
    loadBrowserURL(source, "http://mta/local/html/index.html")
    focusBrowser(source)
    timerScreen = setTimer(checkTimerScreen, 5000, 0)
end

function checkTimerScreen ()
    if (isTransferBoxActive()) then
        return
    end
    if (isTimer(timerScreen)) then
        killTimer(timerScreen)
        setTimer(destroyElement, 5000, 1, initBrowser)
    end
end