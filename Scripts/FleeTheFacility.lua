-- Variables
local ESP = Instance.new(
    "Folder",
    workspace
) ESP.Name = "ESP"
local ESPPC = Instance.new(
    "Folder",
    workspace
) ESPPC.Name = "ESPComputer"
function GetSizeOfObject(Obj)
    if Obj:IsA("BasePart") then
        return Obj.Size
    elseif Obj:IsA("Model") then
        return Obj:GetExtentsSize()
    end
end
function CreateESPPart(BodyPart,r,g,b)
    local ESPPartparent = BodyPart
    local Box = Instance.new("BoxHandleAdornment")
    Box.Size = GetSizeOfObject(ESPPartparent) + Vector3.new(0.1, 0.1, 0.1)
    Box.Name = "ESPPart"
    Box.Adornee = ESPPartparent
    Box.Color3 = Color3.fromRGB(r,g,b)
    Box.AlwaysOnTop = true
    Box.ZIndex = 5
    Box.Transparency = 0.4
    Box.Parent = ESP
    if BodyPart.Parent.Name == game.Players.LocalPlayer.Name then
        Box:remove()
        spawn (function()
            while true do
                wait(0.1)
                if BodyPart ~= nil then
                    Box:remove()
                end
            end
        end)
    end
end
local OldNameCall = nil
OldNameCall = hookmetamethod(game, "__namecall", function(...)
    local Args = {...}
    local Self = Args[1]
    if getnamecallmethod() == "FireServer" and tostring(Self) == "RemoteEvent" and Args[1] == "ReportPhysicsFPS" then
        return wait(math.huge)
    end
    return OldNameCall(...)
end)
local function WalkSpeedBypass()
  local gmt = getrawmetatable(game)
  setreadonly(gmt, false)
  local oldIndex = gmt.__Index
  gmt.__Index = newcclosure(function(self, b)
    if b == 'WalkSpeed' then
      return 16
    end
    return oldIndex(self, b)
  end)
end
local function JumpPowerBypass()
  local gmt = getrawmetatable(game)
  setreadonly(gmt, false)
  local oldIndex = gmt.__Index
  gmt.__Index = newcclosure(function(self, b)
    if b == 'JumpPower' then
      return 50
    end
    return oldIndex(self, b)
  end)
end
local BeastColor = Color3.new(255, 0, 0)
local InoccentColor = Color3.new(255, 255, 255)
local CheckBeast = function()
    for _, v in pairs(game:GetService('Players'):GetChildren()) do
        if v.Name ~= game:GetService('Players').LocalPlayer.Name then
            if v.Character:findFirstChild('BeastPowers') then
                return v.Name
            end
        end
    end
end
local CreateEsp = function()
  for _, v in pairs(game:GetService('Players'):GetChildren()) do
    if v.Name ~= game:GetService('Players').LocalPlayer.Name then
      local Esp = Instance.new('Highlight', v.Character)
      Esp.Name = 'EspPlayer'
      Esp.FillTransparency = 0.5
    end
  end
end
local UpdateEsp = function()
  for _, v in pairs(game:GetService('Players'):GetChildren()) do
    if v.Name ~= game:GetService('Players').LocalPlayer.Name then
      if v.Character:findFirstChild('BeastPowers') then
        v.Character.EspPlayer.FillColor = BeastColor
      else
        v.Character.EspPlayer.FillColor = InoccentColor
      end
    end
  end
end
local KeyPress = function(v)
    return game:GetService("VirtualInputManager"):SendKeyEvent(true, v, false, game)
end
local Map = workspace:FindFirstChild(tostring(game.ReplicatedStorage.CurrentMap.Value))
local NotificationHolder = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Module.Lua"))()
local Notification = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Client.Lua"))()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Darkzao/Darkzao/main/Mudules/Button.lua"))()



-- Library
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local Window = Fluent:CreateWindow({
    Title = "Infinity Hub  |  "..game:GetService('MarketplaceService'):GetProductInfo(game.PlaceId).Name,
    SubTitle = "Modded by blackaham2266",
    TabWidth = 110,
    Size = UDim2.fromOffset(490, 320),
    Acrylic = true,
    Theme = "Light",
    MinimizeKey = Enum.KeyCode.J
})
local Options = Fluent.Options
local Tabs = {
    AutoFarm = Window:AddTab({
        Title = "Farming",
        Icon = "rbxassetid://10709770178"
    }),
    Player = Window:AddTab({
        Title = "LPlayer",
        Icon = "rbxassetid://10747373176"
    }),
    Esp = Window:AddTab({
        Title = "Esp",
        Icon = "rbxassetid://10723346959"
    }),
}



-- Code
Tabs.AutoFarm:AddSection('[ Farming Options ]')
local AutoHackToggle = Tabs.AutoFarm:AddToggle("", {Title = "Auto Hack", Default = false })
AutoHackToggle:OnChanged(function(bool)
    autoHack = bool
    while autoHack do task.wait()
        game:GetService("ReplicatedStorage").RemoteEvent:FireServer("SetPlayerMinigameResult",true)
    end
end)
Tabs.AutoFarm:AddButton({
    Title = "Teleport To Exit Door",
    Description = "",
    Callback = function()
        for _, v in pairs(workspace:GetDescendants()) do
            if (v:IsA('Model') and v.Name == 'ExitDoor') then
                game:GetService('Players').LocalPlayer.Character:PivotTo(v:GetPivot())
            end
        end
    end
})
Tabs.AutoFarm:AddButton({
    Title = "Save Captured Players",
    Description = "",
    Callback = function()
        local oldPos = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
        local TeleportOldPos = '';
        TeleportOldPos = oldPos
        for _, v in pairs(game:GetService('Players'):GetChildren()) do
            if (v.Name ~= game.Players.LocalPlayer.Name) then
                if (v.TempPlayerStatsModule.Captured.Value == true) then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,-2.35)
                    wait(.2)
                    KeyPress('E')
                    wait(.25)
                end
            end
        end
        wait(.2)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(TeleportOldPos)
    end
})
Tabs.AutoFarm:AddButton({
    Title = "Check Beast",
    Description = "Click to check player beast",
    Callback = function()
        Window:Dialog({
            Title = "Check Best Notification",
            Content = "Beast is: "..CheckBeast(),
            Buttons = {
                {
                    Title = "Ok",
                    Callback = function()
                        print("Confirmed the dialog.")
                    end
                },
            }
        })
    end
})


Tabs.Player:AddSection('[ Local Player Options ]')
local AntiRagdollToggle = Tabs.Player:AddToggle("", {Title = "Anti Ragdoll", Default = false })
AntiRagdollToggle:OnChanged(function(bool)
    antiRagdoll = bool
    if antiRagdoll then
        while antiRagdoll do task.wait()
            for _, v in pairs(game:GetService("Players").LocalPlayer.TempPlayerStatsModule:GetChildren()) do
                if (v:IsA('BoolValue') and v.Name == 'Ragdoll') then
                    v.Value = false
                    wait(.2) v.Value = true
                end
            end
        end
    else
        wait(.5)
        for _, v in pairs(game:GetService("Players").LocalPlayer.TempPlayerStatsModule:GetChildren()) do
            if (v:IsA('BoolValue') and v.Name == 'Ragdoll') then
                if (v.Value == true) then
                    v.Value = false
                end
            end
        end
    end
end)
local Method;
local MethodTONoSlow = Tabs.Player:AddDropdown("Dropdown", {
    Title = "Method:",
    Values = {'Remote', 'Speed'},
    Multi = false,
    Default = 1,
})
MethodTONoSlow:OnChanged(function (args)
    Method = args
    print(Method)
end)
local NoSlowToggle = Tabs.Player:AddToggle("", {Title = "No Slow", Default = false })
NoSlowToggle:OnChanged(function(bool)
    NoSlow = bool
    if NoSlow then
        if Method == 'Remote' then
            local oldnc
            oldnc = hookmetamethod(game, "__namecall", newcclosure(function(name, ...)
                   local Args = {...}
                   if not checkcaller() and tostring(name) == "PowersEvent" and Args[1] == "Jumped" then
                       return wait(9e9)
                   end
                   return oldnc(name, unpack(Args))
            end))
        elseif Method == 'Speed' then
            WalkSpeedBypass()
            while NoSlow do task.wait()
                while NoSlow do task.wait()
                    if game.Players.LocalPlayer.Character.Humanoid.WalkSpeed < 16 then
                        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
                    end
                end
            end
        end
    end
end)
local ActiveCrawlingToggle = Tabs.Player:AddToggle("", {Title = "Active Crawling (Beast)", Default = false })
ActiveCrawlingToggle:OnChanged(function(bool)
    antiveCrawling = bool
    while antiveCrawling do task.wait()
        for _, v in pairs(game:GetService("Players").LocalPlayer.TempPlayerStatsModule:GetChildren()) do
            if (v:IsA('BoolValue') and v.Name == 'DisableCrawl') then
                v.Value = false
            end
        end
    end
end)
Tabs.Player:AddButton({
    Title = "No Cooldown Hammer (Beast)",
    Description = "",
    Callback = function()
        Window:Dialog({
            Title = "⚠️ WARING ⚠️",
            Content = "There's no way to fix it once it's activated, just rejoin",
            Buttons = {
                {
                    Title = "Ok",
                    Callback = function()
                        wait = task.wait
                        local a = game:GetService("Players").LocalPlayer.Character or game:GetService("Players").LocalPlayer.CharacterAdded:wait()
                        while wait() do
                            local b = a:FindFirstChildOfClass("Humanoid") or a:FindFirstChildOfClass("AnimationController")
                            if not b or not a then continue end
                            for c, d in next, b:GetPlayingAnimationTracks() do
                                d:AdjustSpeed(15)
                            end
                        end
                    end
                },
                {
                    Title = 'Close',
                    Callback = function()
                        print('.')
                    end
                }
            }
        })
    end
})
Tabs.Player:AddSection('[ Normal Options ]')
local WalkSpeedValue;
local JumpPowerValue;
local Input = Tabs.Player:AddInput("Input", {
    Title = "WalkSpeed",
    Default = "...",
    Placeholder = "",
    Numeric = false,
    Finished = false,
    Callback = function(Value)
        WalkSpeedValue = Value
    end
})
local Input = Tabs.Player:AddInput("Input", {
    Title = "JumpPower",
    Default = "...",
    Placeholder = "",
    Numeric = false,
    Finished = false,
    Callback = function(Value)
        JumpPowerValue = Value
    end
})
Tabs.Player:AddButton({
    Title = "Set WK and JP",
    Description = "",
    Callback = function()
        WalkSpeedBypass()
        JumpPowerBypass()
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = WalkSpeedValue
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = JumpPowerValue
    end
})


Tabs.Esp:AddSection('[ Esp Options ]')
local EspPlayerToggle = Tabs.Esp:AddToggle("", {Title = "Esp Players", Default = false })
EspPlayerToggle:OnChanged(function(bool)
    PlayersEsp = bool
    if PlayersEsp then
        CreateEsp()
        while PlayersEsp do task.wait()
            UpdateEsp()
        end
    else
        for _, x in pairs(workspace:GetDescendants()) do
            if x:IsA('Highlight') and x.Name == 'EspPlayer' then
              x:Destroy()
            end
        end
    end
end)
local EspComputerToggle = Tabs.Esp:AddToggle("", {Title = "Esp Computers", Default = false })
EspComputerToggle:OnChanged(function(bool)
    CumputersEsp = bool
    if CumputersEsp then
        local map = workspace:findFirstChild(tostring(game.ReplicatedStorage.CurrentMap.Value))
        local children = map:GetChildren()
            for i =1, #children do
            if children[i].Name == "ComputerTable" then
                local Box = Instance.new("BoxHandleAdornment")
                Box.Size = GetSizeOfObject(children[i].Screen) + Vector3.new(-0.5, -0.5, -0.5)
                Box.Name = "ESPPart"
                Box.Adornee = children[i].Screen
                spawn (function()
                    while true do
                        wait(0.1)
                        Box.Color3 = children[i].Screen.Color
                    end
                end)
                Box.AlwaysOnTop = true
                Box.ZIndex = 5
                Box.Transparency = 0.4
                Box.Parent = ESPPC
            end
        end
    else
        for _, v in pairs(workspace:GetDescendants()) do
            if v:IsA('BoxHandleAdornment') then
                v:Destroy()
            end
        end
    end
end)



-- Select Tab
Window:SelectTab(1)
