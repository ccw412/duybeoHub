-- vỹ bel / Con Chó Đại Ngu HUB

local player = game.Players.LocalPlayer
local vim = game:GetService("VirtualInputManager")

-- GUI
local gui = Instance.new("ScreenGui", game.CoreGui)
gui.Name = "VyBelHub"

local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0,340,0,340)
main.Position = UDim2.new(0.35,0,0.3,0)
main.BackgroundColor3 = Color3.fromRGB(25,25,25)
main.Active = true
main.Draggable = true

local corner = Instance.new("UICorner", main)
corner.CornerRadius = UDim.new(0,10)

-- nền
local bg = Instance.new("ImageLabel", main)
bg.Size = UDim2.new(1,0,1,0)
bg.Image = "rbxassetid://103671553148241"
bg.BackgroundTransparency = 1

-- tiêu đề
local title = Instance.new("TextLabel", main)
title.Size = UDim2.new(1,0,0,35)
title.Text = "🐶 Con Chó Đại Ngu HUB | vỹ bel"
title.TextScaled = true
title.BackgroundColor3 = Color3.fromRGB(40,40,40)

local titleCorner = Instance.new("UICorner", title)
titleCorner.CornerRadius = UDim.new(0,8)

-- nút thu nhỏ
local minimize = Instance.new("TextButton", main)
minimize.Size = UDim2.new(0,30,0,30)
minimize.Position = UDim2.new(1,-35,0,3)
minimize.Text = "-"

-- nút mở lại
local open = Instance.new("TextButton", gui)
open.Size = UDim2.new(0,60,0,60)
open.Position = UDim2.new(0,40,0,200)
open.Text = "HUB"
open.Visible = false
open.BackgroundColor3 = Color3.fromRGB(0,170,255)
open.TextScaled = true
open.Active = true
open.Draggable = true

local openCorner = Instance.new("UICorner", open)
openCorner.CornerRadius = UDim.new(1,0)

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
			vim:SendKeyEvent(true,"Z",false,game) wait(0.1)
			vim:SendKeyEvent(false,"Z",false,game) wait(0.5)

			vim:SendKeyEvent(true,"X",false,game) wait(0.1)
			vim:SendKeyEvent(false,"X",false,game) wait(0.5)

			vim:SendKeyEvent(true,"C",false,game) wait(0.1)
			vim:SendKeyEvent(false,"C",false,game) wait(0.5)

			vim:SendKeyEvent(true,"V",false,game) wait(0.1)
			vim:SendKeyEvent(false,"V",false,game) wait(1)
		end
		wait()
	end
end)

-- Auto Click
local autoclick = false

local clickBtn = Instance.new("TextButton", main)
clickBtn.Size = UDim2.new(0,150,0,35)
clickBtn.Position = UDim2.new(0,15,0,95)
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
		wait(3)
	end
end)

-- Instant Interact (không cần giữ E)
local instant = false

local instantBtn = Instance.new("TextButton", main)
instantBtn.Size = UDim2.new(0,150,0,35)
instantBtn.Position = UDim2.new(0,15,0,140)
instantBtn.Text = "⚡ Instant Interact OFF"

Instance.new("UICorner", instantBtn)

instantBtn.MouseButton1Click:Connect(function()
	instant = not instant
	instantBtn.Text = instant and "⚡ Instant Interact ON" or "⚡ Instant Interact OFF"

	if instant then
		for _,v in pairs(game:GetDescendants()) do
			if v:IsA("ProximityPrompt") then
				v.HoldDuration = 0
			end
		end
	end
end)

game.DescendantAdded:Connect(function(v)
	if instant and v:IsA("ProximityPrompt") then
		v.HoldDuration = 0
	end
end)

-- TELEPORT FUNCTION
local function teleport(x,y,z)
	local char = player.Character
	if char and char:FindFirstChild("HumanoidRootPart") then
		char.HumanoidRootPart.CFrame = CFrame.new(x,y,z)
	end
end

-- Teleport buttons
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

-- Chỗ bán
tpButton("🛒 Chỗ Bán",-535.47,27.86,1161.16,275)
