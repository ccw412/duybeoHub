-- 🐶 DUY BEO HUB V6 ULTRA

local player = game.Players.LocalPlayer
local vim = game:GetService("VirtualInputManager")
local TweenService = game:GetService("TweenService")
local UIS = game:GetService("UserInputService")

-- SETTINGS
local spam = false
local autoclick = false
local autoFarm = false

local skillSpeed = 0.35
local clickSpeed = 0.15

-- SKILL SELECT
local skillZ = true
local skillX = true
local skillC = true
local skillV = true

-- GUI
local gui = Instance.new("ScreenGui",game.CoreGui)
gui.ResetOnSpawn = false
gui.Name = "DuyBeoHubV6"

-- FLOAT BUTTON
local open = Instance.new("TextButton",gui)
open.Size = UDim2.new(0,60,0,60)
open.Position = UDim2.new(0,20,0.7,0)
open.Text = "🐶"
open.TextScaled = true
open.BackgroundColor3 = Color3.fromRGB(45,45,45)
Instance.new("UICorner",open).CornerRadius = UDim.new(1,0)

-- MAIN
local main = Instance.new("Frame",gui)
main.Size = UDim2.new(0,420,0,360)
main.Position = UDim2.new(0.3,0,0.25,0)
main.BackgroundColor3 = Color3.fromRGB(30,30,30)
main.Visible = false
main.Active = true
main.Draggable = true

Instance.new("UICorner",main)

-- GRADIENT
local gradient = Instance.new("UIGradient",main)
gradient.Color = ColorSequence.new{
ColorSequenceKeypoint.new(0,Color3.fromRGB(60,60,60)),
ColorSequenceKeypoint.new(1,Color3.fromRGB(20,20,20))
}

-- TITLE
local title = Instance.new("TextLabel",main)
title.Size = UDim2.new(1,0,0,40)
title.Text = "🐶 DUY BEO HUB V6 ULTRA"
title.TextScaled = true
title.BackgroundTransparency = 1
title.TextColor3 = Color3.new(1,1,1)

-- OPEN HUB
open.MouseButton1Click:Connect(function()
main.Visible = not main.Visible
end)

-- TAB SYSTEM
local combatTab = Instance.new("TextButton",main)
combatTab.Size = UDim2.new(0.3,0,0,30)
combatTab.Position = UDim2.new(0.02,0,0,45)
combatTab.Text = "⚔ Combat"

local farmTab = combatTab:Clone()
farmTab.Parent = main
farmTab.Position = UDim2.new(0.35,0,0,45)
farmTab.Text = "🌾 Farm"

local tpTab = combatTab:Clone()
tpTab.Parent = main
tpTab.Position = UDim2.new(0.68,0,0,45)
tpTab.Text = "🗺 TP"

for _,b in pairs({combatTab,farmTab,tpTab}) do
b.BackgroundColor3 = Color3.fromRGB(45,45,45)
b.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner",b)
end

-- FRAMES
local combatFrame = Instance.new("Frame",main)
combatFrame.Size = UDim2.new(1,0,1,-90)
combatFrame.Position = UDim2.new(0,0,0,80)
combatFrame.BackgroundTransparency = 1

local farmFrame = combatFrame:Clone()
farmFrame.Parent = main
farmFrame.Visible = false

local tpFrame = combatFrame:Clone()
tpFrame.Parent = main
tpFrame.Visible = false

-- SWITCH
local function switch(frame)

combatFrame.Visible=false
farmFrame.Visible=false
tpFrame.Visible=false

frame.Visible=true

end

combatTab.MouseButton1Click:Connect(function()
switch(combatFrame)
end)

farmTab.MouseButton1Click:Connect(function()
switch(farmFrame)
end)

tpTab.MouseButton1Click:Connect(function()
switch(tpFrame)
end)

-- BUTTON
local function button(parent,text,pos,func)

local b=Instance.new("TextButton",parent)

b.Size=UDim2.new(0,180,0,35)
b.Position=UDim2.new(0,10,0,pos)

b.Text=text
b.BackgroundColor3=Color3.fromRGB(45,45,45)
b.TextColor3=Color3.new(1,1,1)

Instance.new("UICorner",b)

b.MouseButton1Click:Connect(func)

return b

end

-- COMBAT
local spamBtn
spamBtn = button(combatFrame,"⚡ Spam Skill OFF",10,function()

	spam = not spam
	
	if spam then
		spamBtn.Text = "⚡ Spam Skill ON"
	else
		spamBtn.Text = "⚡ Spam Skill OFF"
	end

end)

local clickBtn
clickBtn = button(combatFrame,"🖱 Auto Click OFF",55,function()

	autoclick = not autoclick
	
	if autoclick then
		clickBtn.Text = "🖱 Auto Click ON"
	else
		clickBtn.Text = "🖱 Auto Click OFF"
	end

end)

-- FARM
local farmBtn
farmBtn = button(farmFrame,"🐶 Auto Farm Mixi OFF",10,function()

	autoFarm = not autoFarm
	
	if autoFarm then
		farmBtn.Text = "🐶 Auto Farm Mixi ON"
	else
		farmBtn.Text = "🐶 Auto Farm Mixi OFF"
	end

end)

-- SKILL SELECT UI
local skillTitle = Instance.new("TextLabel",farmFrame)
skillTitle.Size = UDim2.new(1,0,0,25)
skillTitle.Position = UDim2.new(0,0,0,40)
skillTitle.BackgroundTransparency = 1
skillTitle.Text = "🎮 Chọn Skill Spam"
skillTitle.TextColor3 = Color3.new(1,1,1)
skillTitle.TextScaled = true
local function skillToggle(name,posX)

	local btn = Instance.new("TextButton",farmFrame)
	btn.Size = UDim2.new(0,80,0,35)
	btn.Position = UDim2.new(0,posX,0,60)

	btn.BackgroundColor3 = Color3.fromRGB(45,45,45)
	btn.TextColor3 = Color3.new(1,1,1)
	Instance.new("UICorner",btn)

	local function updateText(state)
		btn.Text = name.." "..(state and "ON" or "OFF")
	end

	local function getState()
		if name=="Z" then return skillZ end
		if name=="X" then return skillX end
		if name=="C" then return skillC end
		if name=="V" then return skillV end
	end

	local function setState(state)
		if name=="Z" then skillZ = state end
		if name=="X" then skillX = state end
		if name=="C" then skillC = state end
		if name=="V" then skillV = state end
	end

	updateText(getState())

	btn.MouseButton1Click:Connect(function()

		local newState = not getState()
		setState(newState)
		updateText(newState)

	end)

end

-- tạo nút skill
skillToggle("Z",20)
skillToggle("X",110)
skillToggle("C",200)
skillToggle("V",290)

-- TELEPORT
local function tp(name,x,y,z,pos)

button(tpFrame,name,pos,function()

local char = player.Character or player.CharacterAdded:Wait()
local hrp = char:WaitForChild("HumanoidRootPart")

hrp.CFrame = CFrame.new(x,y,z)

end)

end

-- TP đảo
tp("🏝 Đảo 1",113.00,61.33,-39.73,10)
tp("🏝 Đảo 2",1736,24,-388,55)
tp("🏝 Đảo 3",1080,26,1356,100)
tp("🏝 Đảo 4",572,33,-945,145)
tp("🏝 Đảo 5",-399,24,1058,190)
tp("🏝 Đảo 6",-779.50,27.06,-290.93,235)
tp("🏝 Đảo 7",-517.81,62.28,-1258.95,280)

-- TP bán
tp("🛒 Bán",-535,27,1161,325)

-- LOOP
spawn(function()

while task.wait() do

if spam or autoFarm then

if skillZ then
vim:SendKeyEvent(true,"Z",false,game)
task.wait(skillSpeed)
vim:SendKeyEvent(false,"Z",false,game)
end

if skillX then
vim:SendKeyEvent(true,"X",false,game)
task.wait(skillSpeed)
vim:SendKeyEvent(false,"X",false,game)
end

if skillC then
vim:SendKeyEvent(true,"C",false,game)
task.wait(skillSpeed)
vim:SendKeyEvent(false,"C",false,game)
end

if skillV then
vim:SendKeyEvent(true,"V",false,game)
task.wait(skillSpeed)
vim:SendKeyEvent(false,"V",false,game)
end

end

if autoclick or autoFarm then
vim:SendMouseButtonEvent(0,0,0,true,game,0)
vim:SendMouseButtonEvent(0,0,0,false,game,0)
end

task.wait(clickSpeed)

end

end)

-- INSTANT NPC
for _,v in pairs(workspace:GetDescendants()) do
if v:IsA("ProximityPrompt") then
v.HoldDuration=0
end
end
