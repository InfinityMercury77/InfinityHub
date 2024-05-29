-- (VOID) : Gui to Lua
-- Version: 1.4

-- Instances:

local BannerNotification = Instance.new("ScreenGui")
local ActiveNotifications = Instance.new("Frame")
local List = Instance.new("UIListLayout")
local Padding = Instance.new("UIPadding")
local Canvas = Instance.new("Frame")
local Shape = Instance.new("ImageLabel")
local Scale = Instance.new("UIScale")
local Notification = Instance.new("ImageLabel")
local Scale_2 = Instance.new("UIScale")
local Padding_2 = Instance.new("UIPadding")
local Icon = Instance.new("ImageLabel")
local Texts = Instance.new("CanvasGroup")
local Header = Instance.new("TextLabel")
local SizeConstraint = Instance.new("UISizeConstraint")
local List_2 = Instance.new("UIListLayout")
local Padding_3 = Instance.new("UIPadding")
local Description = Instance.new("TextLabel")
local SizeConstraint_2 = Instance.new("UISizeConstraint")
local Padding_4 = Instance.new("UIPadding")

--Properties:

BannerNotification.Name = "BannerNotification"
BannerNotification.Parent = (game:GetService("CoreGui") or gethui())
BannerNotification.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
BannerNotification.DisplayOrder = 100
BannerNotification.ResetOnSpawn = false

ActiveNotifications.Name = "ActiveNotifications"
ActiveNotifications.Parent = BannerNotification
ActiveNotifications.AnchorPoint = Vector2.new(0.5, 0.5)
ActiveNotifications.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
ActiveNotifications.BackgroundTransparency = 1.000
ActiveNotifications.BorderColor3 = Color3.fromRGB(0, 0, 0)
ActiveNotifications.BorderSizePixel = 9
ActiveNotifications.Position = UDim2.new(0.5, 0, 0.5, 0)
ActiveNotifications.Size = UDim2.new(1, 0, 1, 0)

List.Name = "List"
List.Parent = ActiveNotifications
List.HorizontalAlignment = Enum.HorizontalAlignment.Center
List.SortOrder = Enum.SortOrder.LayoutOrder

Padding.Name = "Padding"
Padding.Parent = ActiveNotifications
Padding.PaddingTop = UDim.new(0, 10)

Canvas.Name = "Canvas"
Canvas.Parent = BannerNotification
Canvas.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Canvas.BackgroundTransparency = 1.000
Canvas.BorderColor3 = Color3.fromRGB(0, 0, 0)
Canvas.BorderSizePixel = 0
Canvas.Size = UDim2.new(1, 0, 0, 0)
Canvas.Visible = false

Shape.Name = "Shape"
Shape.Parent = Canvas
Shape.AnchorPoint = Vector2.new(0.5, 0.5)
Shape.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Shape.BackgroundTransparency = 1.000
Shape.BorderColor3 = Color3.fromRGB(0, 0, 0)
Shape.BorderSizePixel = 0
Shape.Position = UDim2.new(0.5, 0, 0.5, 0)
Shape.Size = UDim2.new(0, 60, 0, 60)
Shape.Image = "rbxassetid://11983017276"
Shape.ImageColor3 = Color3.fromRGB(0, 0, 0)
Shape.ImageTransparency = 0.500
Shape.ScaleType = Enum.ScaleType.Slice
Shape.SliceCenter = Rect.new(512, 512, 512, 512)

Scale.Name = "Scale"
Scale.Parent = Shape

Notification.Name = "Notification"
Notification.Parent = Canvas
Notification.AnchorPoint = Vector2.new(0.5, 0)
Notification.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Notification.BackgroundTransparency = 1.000
Notification.BorderColor3 = Color3.fromRGB(0, 0, 0)
Notification.BorderSizePixel = 0
Notification.Position = UDim2.new(0.5, 0, 0, 0)
Notification.Image = "rbxassetid://11942813307"
Notification.ImageColor3 = Color3.fromRGB(0, 0, 0)
Notification.ImageTransparency = 0.300
Notification.ScaleType = Enum.ScaleType.Slice
Notification.SliceCenter = Rect.new(512, 512, 512, 512)

Scale_2.Name = "Scale"
Scale_2.Parent = Notification

Padding_2.Name = "Padding"
Padding_2.Parent = Notification
Padding_2.PaddingBottom = UDim.new(0, 5)
Padding_2.PaddingLeft = UDim.new(0, 10)
Padding_2.PaddingRight = UDim.new(0, 25)
Padding_2.PaddingTop = UDim.new(0, 5)

Icon.Name = "Icon"
Icon.Parent = Notification
Icon.AnchorPoint = Vector2.new(0, 0.5)
Icon.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Icon.BackgroundTransparency = 1.000
Icon.BorderSizePixel = 0
Icon.Position = UDim2.new(0, 15, 0.5, 0)
Icon.Size = UDim2.new(0, 30, 0, 30)
Icon.ZIndex = 2
Icon.Image = "rbxassetid://11326670020"
Icon.ImageTransparency = 0.100
Icon.ScaleType = Enum.ScaleType.Fit

Texts.Name = "Texts"
Texts.Parent = Notification
Texts.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Texts.BackgroundTransparency = 1.000
Texts.BorderColor3 = Color3.fromRGB(0, 0, 0)
Texts.BorderSizePixel = 0
Texts.Size = UDim2.new(1, -50, 0, 50)

Header.Name = "Header"
Header.Parent = Texts
Header.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Header.BackgroundTransparency = 1.000
Header.BorderColor3 = Color3.fromRGB(0, 0, 0)
Header.BorderSizePixel = 0
Header.ZIndex = 2
Header.Font = Enum.Font.GothamMedium
Header.Text = "Header"
Header.TextColor3 = Color3.fromRGB(255, 255, 255)
Header.TextSize = 17.000
Header.TextTransparency = 0.100
Header.TextWrapped = true
Header.TextXAlignment = Enum.TextXAlignment.Left

SizeConstraint.Name = "SizeConstraint"
SizeConstraint.Parent = Header
SizeConstraint.MaxSize = Vector2.new(300, INF)
SizeConstraint.MinSize = Vector2.new(250, 0)

List_2.Name = "List"
List_2.Parent = Texts
List_2.SortOrder = Enum.SortOrder.LayoutOrder
List_2.VerticalAlignment = Enum.VerticalAlignment.Center
List_2.Padding = UDim.new(0, 2)

Padding_3.Name = "Padding"
Padding_3.Parent = Texts
Padding_3.PaddingBottom = UDim.new(0, 10)
Padding_3.PaddingLeft = UDim.new(0, 65)
Padding_3.PaddingTop = UDim.new(0, 10)

Description.Name = "Description"
Description.Parent = Texts
Description.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Description.BackgroundTransparency = 1.000
Description.BorderColor3 = Color3.fromRGB(0, 0, 0)
Description.BorderSizePixel = 0
Description.ZIndex = 2
Description.Font = Enum.Font.Gotham
Description.Text = "Description"
Description.TextColor3 = Color3.fromRGB(255, 255, 255)
Description.TextSize = 14.000
Description.TextTransparency = 0.500
Description.TextWrapped = true
Description.TextXAlignment = Enum.TextXAlignment.Left

SizeConstraint_2.Name = "SizeConstraint"
SizeConstraint_2.Parent = Description
SizeConstraint_2.MaxSize = Vector2.new(300, INF)
SizeConstraint_2.MinSize = Vector2.new(250, 0)

Padding_4.Name = "Padding"
Padding_4.Parent = Canvas
Padding_4.PaddingBottom = UDim.new(0, 10)
Padding_4.PaddingTop = UDim.new(0, 10)

-- Scripts:

local function TMYZ_fake_script() -- BannerNotification.ServerConnection 
	local script = Instance.new('LocalScript', BannerNotification)

	local replicatedStorage = game:GetService("ReplicatedStorage")
	local tweenService = game:GetService("TweenService")
	
	local info = TweenInfo.new(.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out, 0, false, 0)
	
	local notifyEvent = replicatedStorage:WaitForChild("BannerNotification_Storage").BannerNotify
	
	local ui = script.Parent
	
	local activeFrame = ui.ActiveNotifications
	local canvasTemplate = ui.Canvas
	
	notifyEvent.OnClientEvent:Connect(function(header, description, icon, duration, configs, default)
		local notif = canvasTemplate:Clone()
	
		--// set up
	
		notif.Name = header
		notif.Parent = activeFrame
	
		notif.Notification.Texts.Header.Text = header
		notif.Notification.Texts.Description.Text = description
		notif.Notification.Icon.Image = icon
	
		notif.Notification.ImageTransparency = 1
		notif.Notification.Icon.ImageTransparency = 1
		notif.Notification.Texts.GroupTransparency = 1
	
		notif.Shape.ImageColor3 = (configs and configs[2]) or default[2]
		notif.Notification.Texts.GroupColor3 = (configs and configs[4]) or default[4]
		notif.Notification.Icon.ImageColor3 = (configs and configs[4]) or default[4]
	
		notif.Visible = true
	
		--// animation initiation
	
		notif.Shape.Scale.Scale = 0
		notif.Shape.ImageTransparency = 1
	
		tweenService:Create(notif.Shape, info, {ImageTransparency = (configs and configs[1]) or default[1]}):Play()
		tweenService:Create(notif.Shape.Scale, info, {Scale = 1.2}):Play()
	
		----------------
	
		task.wait(.3)
	
		--// transformed the shape to circle
	
		notif.Shape.Image = "rbxassetid://11942813307"
	
		tweenService:Create(notif.Shape, info, {Size = UDim2.fromOffset(notif.Notification.AbsoluteSize.X, notif.Notification.AbsoluteSize.Y)
		}):Play()
		tweenService:Create(notif.Shape.Scale, info, {Scale = 1}):Play()
	
		----------------
	
		task.wait(.1)
	
		----------------
	
		tweenService:Create(notif.Notification.Texts, info, {GroupTransparency = (configs and configs[3]) or default[3]}):Play()
		tweenService:Create(notif.Notification.Icon, info, {ImageTransparency = (configs and configs[3]) or default[3]}):Play()
	
		--// duration started
	
		task.wait(duration)
	
		--// duration ended
	
		tweenService:Create(notif.Notification.Texts, info, {GroupTransparency = 1}):Play()
		tweenService:Create(notif.Notification.Icon, info, {ImageTransparency = 1}):Play()
	
		----------------
	
		task.wait(.2)
	
		--// transformed the shape back to circle
	
		notif.Shape.Image = "rbxassetid://11983017276" -- circle
	
		tweenService:Create(notif.Shape, info, {Size = UDim2.fromOffset(60, 60), 
			ImageTransparency = (configs and configs[1]) or default[1]}):Play()
	
		tweenService:Create(notif.Shape.Scale, info, {Scale = 1.2}):Play()
	
		----------------
	
		task.wait(.3)
	
		----------------
	
		tweenService:Create(notif.Shape, info, {ImageTransparency = 1}):Play()
		tweenService:Create(notif.Shape.Scale, info, {Scale = 0}):Play()
	
		----------------
	
		task.wait(.3)
	
		----------------
	
		tweenService:Create(notif.Padding, info, {PaddingTop = UDim.new(0, 0)}):Play()
		tweenService:Create(notif.Padding, info, {PaddingBottom = UDim.new(0, 0)}):Play()
	
		tweenService:Create(notif.Notification.Scale, info, {Scale = 0}):Play()
	
		----------------
	
		task.wait(.3)
	
		----------------
	
		notif:Destroy()
	end)
end
coroutine.wrap(TMYZ_fake_script)()
