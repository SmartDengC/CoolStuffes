-- require("keyboard") -- Load Hammerspoon bits from https://github.com/jasonrudolph/keyboard

local application = require("hs.application")
local window = require("hs.window")
local hotkey = require("hs.hotkey")
local alert = require("hs.alert")
local grid = require("hs.grid")
local hints = require("hs.hints")
local applescript = require("hs.applescript")

-- hyper
local hyper = { "ctrl", "alt", "cmd", "shift" }

-- no animation Duration
window.animationDuration = 0

-- window hints
hints.fontName = "Avenir"
hints.fontSize = 25
hints.hintChars = { "A", "S", "D", "F", "J", "K", "L", "Q", "W" }
hints.iconAlpha = 1.0
hints.showTitleThresh = 0

-- make the alerts look nicer.
alert.defaultStyle.strokeColor = { white = 1, alpha = 0 }
alert.defaultStyle.fillColor = { white = 0.05, alpha = 0.75 }
alert.defaultStyle.radius = 5
alert.defaultStyle.fadeOutDuration = 0.5
-- alert.defaultStyle.textFont = "Fira Mono"
alert.defaultStyle.textSize = 20

-- grid sized windows management
grid.GRIDWIDTH = 8
grid.GRIDHEIGHT = 8
grid.MARGINX = 0
grid.MARGINY = 0

local gw = grid.GRIDWIDTH
local gh = grid.GRIDHEIGHT

-- 以左上角为0,0 gw
local gomiddle = { x = 0, y = 1, w = gw, h = 6 } -- hyper 2 > 1,1,6,6
local gocenter = { x = 1, y = 1, w = 4, h = 4 } -- hyper 1
local gobig = { x = 0, y = 0, w = gw, h = gh } -- hyper 3

-- 中心 小中心 大全屏

hotkey.bind(hyper, "1", function()
	grid.set(window.focusedWindow(), gocenter)
end)
hotkey.bind(hyper, "2", function()
	grid.set(window.focusedWindow(), gomiddle)
end)
hotkey.bind(hyper, "3", function()
	grid.set(window.focusedWindow(), gobig)
end)

-- this part is for open or focus app windows
local key2App = {
	a = "Apifox",
	-- b = "豆包", -- b for browser
	c = "Google Chrome", --vscode
	d = "TablePlus", -- d for dict
	e = "iTerm2", -- e for editor
	f = "Safari浏览器",
	g = "网易有道翻译", -- used --center babe
	-- h = '',
	i = "IntelliJ IDEA",
	-- j = "Spotify",
	-- k = "",
	-- l = 'Dictionary',
	m = "Messages", -- m for music
	n = "时钟",
	-- o = "Obsidian", -- used --max babe
	p = "PyCharm",
	-- q = "Termius",
	-- q = "Postman",
    r = "Typora",
	s = "Dbeaver",
	-- s = "System Preferences",

	t = "Obsidian", -- t for term
	u = "Cursor",
	v = "Visual Studio Code",
	-- w = "微信",
	x = "Termius",
	-- y = 'Dictionary',
	z = "网易有道翻译",
}

for key, app in pairs(key2App) do
	hotkey.bind(hyper, key, function()
		--application.launchOrFocus(app)
		toggle_application(app)
		--hs.grid.set(hs.window.focusedWindow(), gomiddle)
	end)
end

-- Toggle application focus
function toggle_application(_app)
	-- finds a running applications
	local app = application.find(_app)
	if not app then
		-- application not running, launch app
		application.launchOrFocus(_app)
		return
	end
	-- application running, toggle hide/unhide
	local mainwin = app:mainWindow()
	if mainwin then
		if true == app:isFrontmost() then
			mainwin:application():hide()
		else
			mainwin:application():activate(true)
			mainwin:application():unhide()
			mainwin:focus()
		end
	else
		-- no windows, maybe hide
		if true == app:hide() then
			-- focus app
			application.launchOrFocus(_app)
		else
			-- nothing to do
		end
	end
end

--run applescript
--function: read applescript content
function applescript_reader(string)
	local path = string
	local file = io.open(path, "r")
	local data = file:read("*a")
	file:close()
	return data
end
