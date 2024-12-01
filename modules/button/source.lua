-- (VOID) : Gui to Lua
-- Version: 1.4

-- Instances:

local Button = Instance.new("ScreenGui")
local Close = Instance.new("TextButton")
local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
local Icon = Instance.new("ImageButton")
local UICorner = Instance.new("UICorner")
local UICorner_2 = Instance.new("UICorner")
local Open = Instance.new("TextButton")
local UIAspectRatioConstraint_2 = Instance.new("UIAspectRatioConstraint")
local Icon_2 = Instance.new("ImageButton")
local UICorner_3 = Instance.new("UICorner")

--Properties:

Button.Name = "Button"
Button.Parent = (game:GetService("CoreGui") or gethui())
Button.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Close.Name = "Close"
Close.Parent = Button
Close.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
Close.BorderColor3 = Color3.fromRGB(0, 0, 0)
Close.BorderSizePixel = 0
Close.Position = UDim2.new(0.112595417, 0, 0.176110268, 0)
Close.Size = UDim2.new(0.0534351133, 0, 0.0750382766, 0)
Close.AutoButtonColor = false
Close.Font = Enum.Font.SourceSans
Close.Text = ""
Close.TextColor3 = Color3.fromRGB(0, 0, 0)
Close.TextSize = 14.000

UIAspectRatioConstraint.Parent = Close
UIAspectRatioConstraint.AspectRatio = 1.143

Icon.Name = "Icon"
Icon.Parent = Close
Icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Icon.BackgroundTransparency = 1.000
Icon.BorderColor3 = Color3.fromRGB(0, 0, 0)
Icon.BorderSizePixel = 0
Icon.Position = UDim2.new(0.214285716, 0, 0.142857149, 0)
Icon.Size = UDim2.new(0, 32, 0, 34)
Icon.Image = "rbxassetid://10723415766"

UICorner.Parent = Close

UICorner_2.Parent = Button

Open.Name = "Open"
Open.Parent = Button
Open.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
Open.BorderColor3 = Color3.fromRGB(0, 0, 0)
Open.BorderSizePixel = 0
Open.Position = UDim2.new(0.112595417, 0, 0.176110268, 0)
Open.Size = UDim2.new(0.0534351133, 0, 0.0750382766, 0)
Open.Visible = false
Open.AutoButtonColor = false
Open.Font = Enum.Font.SourceSans
Open.Text = ""
Open.TextColor3 = Color3.fromRGB(0, 0, 0)
Open.TextSize = 14.000

UIAspectRatioConstraint_2.Parent = Open
UIAspectRatioConstraint_2.AspectRatio = 1.143

Icon_2.Name = "Icon"
Icon_2.Parent = Open
Icon_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Icon_2.BackgroundTransparency = 1.000
Icon_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Icon_2.BorderSizePixel = 0
Icon_2.Position = UDim2.new(0.214285716, 0, 0.142857149, 0)
Icon_2.Size = UDim2.new(0, 32, 0, 34)
Icon_2.Image = "rbxassetid://10723415766"

UICorner_3.Parent = Open

-- Scripts:

local function SCWKA_fake_script() -- Close.LocalScript 
	local script = Instance.new('LocalScript', Close)

	local button = script.Parent
	local open = script.Parent.Parent.Open 
	button.MouseButton1Click:Connect(function()
		game:GetService('VirtualInputManager'):SendKeyEvent(true, "K", false, lmy)
		button.Visible = false
		open.Visible = true
	end)
end
coroutine.wrap(SCWKA_fake_script)()
local function ZYYRVS_fake_script() -- Open.LocalScript 
	local script = Instance.new('LocalScript', Open)

	local button = script.Parent
	local close = script.Parent.Parent.Close 
	button.MouseButton1Click:Connect(function()
		game:GetService('VirtualInputManager'):SendKeyEvent(true, "K", false, lmy)
		button.Visible = false
		close.Visible = true
	end)
end
coroutine.wrap(ZYYRVS_fake_script)()
