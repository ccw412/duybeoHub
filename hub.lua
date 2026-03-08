-- vỹ bel / Con Chó Đại Ngu HUB

local player = game.Players.LocalPlayer
local vim = game:GetService("VirtualInputManager")

-- tốc độ
local skillSpeed = 0.4
local clickSpeed = 1

-- GUI
local gui = Instance.new("ScreenGui", game.CoreGui)
gui.Name = "VyBelHub"

local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0,340,0,380)
main.Position = UDim2.new(0.35,0,0.3,0)
main.BackgroundColor3 = Color3.fromRGB(25,25,25)
main.Active = true
main.Draggable = true
Instance.new("UICorner", main)

-- nền meme con mèo
local bg = Instance.new("ImageLabel", main)
bg.Size = UDim2.new(1,0,1,0)
bg.Position = UDim2.new(0,0,0,0)
bg.Image = "rbxassetid://103671553148241"
bg.BackgroundTransparency = 1
bg.ImageTransparency = 0.25
bg.ScaleType = Enum.ScaleType.Stretch

-- tiêu đề
local title = Instance.new("TextLabel", main)
title.Size = UDim2.new(1,0,0,35)
title.Text = "🐶 Con Chó Đại Ngu HUB | vỹ bel"
title.TextScaled = true
title.BackgroundColor3 = Color3.fromRGB(40,40,40)
Instance.new("UICorner", title)

-- thu nhỏ
local minimize = Instance.new("TextButton", main)
minimize.Size = UDim2.new(0,30,0,30)
minimize.Position = UDim2.new(1,-35,0,3)
minimize.Text = "-"

local open = Instance.new("TextButton", gui)
open.Size = UDim2.new(0,60,0,60)
open.Position = UDim2.new(0,40,0,200)
open.Text = "HUB"
open.Visible = false
open.BackgroundColor3 = Color3.fromRGB(0,170,255)
open.TextScaled = true
open.Active = true
open.Draggable = true
Instance.new("UICorner", open).CornerRadius = UDim.new(1,0)

minimize.MouseButton1Click:Connect(function()
	main.Visible = false
	open.Visible = true
end)

open.MouseButton1Click:Connect(function()
	main.Visible = true
	open.Visible = false
end)

-- Spam Skill
local spam = false

local spamBtn = Instance.new("TextButton", main)
spamBtn.Size = UDim2.new(0,150,0,35)
spamBtn.Position = UDim2.new(0,15,0,50)
spamBtn.Text = "⚡ Spam Skill OFF"
Instance.new("UICorner", spamBtn)

spamBtn.MouseButton1Click:Connect(function()
	spam = not spam
	spamBtn.Text = spam and "⚡ Spam Skill ON" or "⚡ Spam Skill OFF"
end)

spawn(function()
	while true do
		if spam then
			for _,k in pairs({"Z","X","C","V"}) do
				vim:SendKeyEvent(true,k,false,game)
				wait(0.1)
				vim:SendKeyEvent(false,k,false,game)
				wait(skillSpeed)
			end
		end
		wait(0.1)
	end
end)

-- ⚡ chỉnh tốc độ skill
local skillUp = Instance.new("TextButton", main)
skillUp.Size = UDim2.new(0,70,0,30)
skillUp.Position = UDim2.new(0,15,0,90)
skillUp.Text = "Skill +"
Instance.new("UICorner", skillUp)

skillUp.MouseButton1Click:Connect(function()
	skillSpeed = math.max(0.05, skillSpeed - 0.05)
end)

local skillDown = Instance.new("TextButton", main)
skillDown.Size = UDim2.new(0,70,0,30)
skillDown.Position = UDim2.new(0,95,0,90)
skillDown.Text = "Skill -"
Instance.new("UICorner", skillDown)

skillDown.MouseButton1Click:Connect(function()
	skillSpeed = skillSpeed + 0.05
end)

-- Auto Click
local autoclick = false

local clickBtn = Instance.new("TextButton", main)
clickBtn.Size = UDim2.new(0,150,0,35)
clickBtn.Position = UDim2.new(0,15,0,130)
clickBtn.Text = "🖱 Auto Click OFF"
Instance.new("UICorner", clickBtn)

clickBtn.MouseButton1Click:Connect(function()
	autoclick = not autoclick
	clickBtn.Text = autoclick and "🖱 Auto Click ON" or "🖱 Auto Click OFF"
end)

spawn(function()
	while true do
		if autoclick then
			vim:SendMouseButtonEvent(0,0,0,true,game,0)
			vim:SendMouseButtonEvent(0,0,0,false,game,0)
		end
		wait(clickSpeed)
	end
end)

-- 🖱 chỉnh tốc độ click
local clickUp = Instance.new("TextButton", main)
clickUp.Size = UDim2.new(0,70,0,30)
clickUp.Position = UDim2.new(0,15,0,170)
clickUp.Text = "Click +"
Instance.new("UICorner", clickUp)

clickUp.MouseButton1Click:Connect(function()
	clickSpeed = math.max(0.05, clickSpeed - 0.05)
end)

local clickDown = Instance.new("TextButton", main)
clickDown.Size = UDim2.new(0,70,0,30)
clickDown.Position = UDim2.new(0,95,0,170)
clickDown.Text = "Click -"
Instance.new("UICorner", clickDown)

clickDown.MouseButton1Click:Connect(function()
	clickSpeed = clickSpeed + 0.05
end)

-- ⚡ Instant bật sẵn
local instant = true

local function applyInstant()
	for _,v in pairs(game:GetDescendants()) do
		if v:IsA("ProximityPrompt") then
			v.HoldDuration = 0
		end
	end
end

applyInstant()

game.DescendantAdded:Connect(function(v)
	if instant and v:IsA("ProximityPrompt") then
		v.HoldDuration = 0
	end
end)

-- teleport
local function teleport(x,y,z)
	local char = player.Character
	if char and char:FindFirstChild("HumanoidRootPart") then
		char.HumanoidRootPart.CFrame = CFrame.new(x,y,z)
	end
end

local function tpButton(name,x,y,z,posY)
	local b = Instance.new("TextButton", main)
	b.Size = UDim2.new(0,140,0,35)
	b.Position = UDim2.new(1,-155,0,posY)
	b.Text = name
	Instance.new("UICorner", b)

	b.MouseButton1Click:Connect(function()
		teleport(x,y,z)
	end)
end

tpButton("🏝 Đảo 1",178.05,22.71,59.37,50)
tpButton("🏝 Đảo 2",1736.64,24.57,-388.55,95)
tpButton("🏝 Đảo 3",1080.65,26.76,1356.08,140)
tpButton("🏝 Đảo 4",572.53,33.05,-945.76,185)
tpButton("🏝 Đảo 5",-399.96,24.02,1058.49,230)
tpButton("🛒 Chỗ Bán",-535.47,27.86,1161.16,275)
