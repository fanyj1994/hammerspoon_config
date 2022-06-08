-- Specify Spoons which will be loaded
hspoon_list = {"AClock", "BingDaily", -- "Calendar",
"CircleClock", "ClipShow", "CountDown", "FnMate", "HCalendar", "HSaria2", "HSearch", -- "KSheet",
"SpeedMenu", -- "TimeFlow",
-- "UnsplashZ",
"WinWin"}

-- appM environment keybindings. Bundle `id` is prefered, but application `name` will be ok.
hsapp_list = {{
    key = 'a',
    name = 'Visual Studio Code'
}, {
    key = 'c',
    id = 'com.google.Chrome'
}, {
    key = 's',
    name = 'ShadowsocksX'
}, 
-- {
--     key = 'd',
--     name = 'draw.io'
-- }, 
{
    key = 'g',
    name = 'uGit'
},
{
    key = 'r',
    name = 'Microsoft Word'
},
{
    key = 'l',
    name = 'Microsoft Excel'
},
{
    key = 'd',
    name = 'Excalidraw'
},
{
    key = 'h',
    name = 'music.app'
},
{
    key = 'b',
    name = 'Cubox'
},
{
    key = 'f',
    name = 'Finder'
}, {
    key = 'i',
    name = 'iTerm'
}, {
    key = 'M',
    name = 'TencentMeeting.app'
}, {
    key = 'o',
    name = 'notion'
},  {
    key = 't',
    name = 'WeTERM'
},
{
    key = 'e',
    name = '印象笔记'
}, {
    key = 'i',
    name = 'iTerm'
}, {
    key = 'w',
    name = '企业微信'
}, {
    key = 'v',
    name = 'WeChat'
}, {
    key = 'q',
    name = 'QQMusic'
}, {
    key = 'x',
    name = 'XMind'
}, {
    key = 'y',
    id = 'com.apple.systempreferences'
}}

-- Modal supervisor keybinding, which can be used to temporarily disable ALL modal environments.
hsupervisor_keys = {{"cmd", "shift", "ctrl"}, "Q"}

-- Reload Hammerspoon configuration
hsreload_keys = {{"cmd", "shift", "ctrl"}, "R"}

-- Toggle help panel of this configuration.
hshelp_keys = {{"alt", "shift"}, "/"}

-- aria2 RPC host address
hsaria2_host = "http://localhost:6800/jsonrpc"
-- aria2 RPC host secret
hsaria2_secret = "token"
windowHotkey = {'control', 'command'}
hs.hotkey.bind(windowHotkey, 'return', function()
    hs.grid.maximizeWindow()
end)

hs.hotkey.bind(windowHotkey, 'F', function()
    hs.window.focusedWindow():toggleFullScreen()
end)

hs.hotkey.bind(windowHotkey, 'left', function()
    local w = hs.window.focusedWindow()
    if not w then
        return
    end
    local s = w:screen():toWest()
    if s then
        w:moveToScreen(s)
    end
end)

hs.hotkey.bind(windowHotkey, 'right', function()
    local w = hs.window.focusedWindow()
    if not w then
        return
    end
    local s = w:screen():toEast()
    if s then
        w:moveToScreen(s)
    end
end)

----------------------------------------------------------------------------------------------------
-- Those keybindings below could be disabled by setting to {"", ""} or {{}, ""}

-- Window hints keybinding: Focuse to any window you want
hswhints_keys = {"alt", "tab"}

-- appM environment keybinding: Application Launcher
hsappM_keys = {"alt", "A"}

-- clipshowM environment keybinding: System clipboard reader
hsclipsM_keys = {"alt", "C"}

-- Toggle the display of aria2 frontend
hsaria2_keys = {"alt", "D"}

-- Launch Hammerspoon Search
hsearch_keys = {"alt", "G"}

-- Read Hammerspoon and Spoons API manual in default browser
hsman_keys = {"alt", "H"}

-- countdownM environment keybinding: Visual countdown
hscountdM_keys = {"alt", "I"}

-- Lock computer's screen
hslock_keys = {"alt", "L"}

-- resizeM environment keybinding: Windows manipulation
hsresizeM_keys = {"alt", "R"}

-- cheatsheetM environment keybinding: Cheatsheet copycat
hscheats_keys = {"alt", "S"}

-- Show digital clock above all windows
hsaclock_keys = {"alt", "T"}

-- Type the URL and title of the frontmost web page open in Google Chrome or Safari.
hstype_keys = {"alt", "V"}

-- Toggle Hammerspoon console
hsconsole_keys = {"alt", "Z"}

function changeVolume(diff)
    return function()
        local current = hs.audiodevice.defaultOutputDevice():volume()
        local new = math.min(100, math.max(0, math.floor(current + diff)))
        if new > 0 then
            hs.audiodevice.defaultOutputDevice():setMuted(false)
        end
        hs.alert.closeAll(0.0)
        hs.alert.show("Volume " .. new .. "%", {}, 0.5)
        hs.audiodevice.defaultOutputDevice():setVolume(new)
    end
end

hs.hotkey.bind(windowHotkey, 'Down', changeVolume(-3))
hs.hotkey.bind(windowHotkey, 'Up', changeVolume(3))
