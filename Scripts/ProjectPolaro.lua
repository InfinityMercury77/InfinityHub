-- Variables Settings
function PokePart()
    local pokePart = {};
    for _, v in pairs(game:GetService("Players").LocalPlayer.PokemonParty:GetChildren()) do
        if v:IsA('Configuration') then
            table.insert(pokePart, v.Name)
        end
    end
    return pokePart
end
function Teleport(Path, WorldPivot, PivotTo)
    local bool = WorldPivot
    local boolTwo = PivotTo
    if bool then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Path.WorldPivot
    end
    if boolTwo then
        game.Players.LocalPlayer.Character:PivotTo(Path:GetPivot())
    end
end
function GetOppPokemon()
	for _, v in pairs(game:GetService("Players").LocalPlayer.OppPokemon:GetChildren()) do
		return v
	end
end
local queue_on_teleport = queue_on_teleport or syn and syn.queue_on_teleport
queue_on_teleport[[
    repeat wait() until game:IsLoaded() print("ServerHoped or rejoined")
    wait(2)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Darkzao/Darkzao/main/Scripts/ProjectPolaro.lua",true))()
]]



-- Library
loadstring(game:HttpGet("https://raw.githubusercontent.com/Darkzao/Darkzao/main/Mudules/Button.lua"))()
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local Window = Fluent:CreateWindow({
    Title = "Infinity Hub  |  Project Polaro",
    SubTitle = "Modded by blackaham2266",
    TabWidth = 110,
    Size = UDim2.fromOffset(490, 312),
    Acrylic = true,
    Theme = "Light",
    MinimizeKey = Enum.KeyCode.J
})
local Options = Fluent.Options
local Tabs = {
    welcomeTab = Window:AddTab({
        Title = "Welcome",
        Icon = "rbxassetid://4483362458"
    }),
    movesTab = Window:AddTab({
        Title = "Moves",
        Icon = "rbxassetid://4483362458"
    }),
    battleTab = Window:AddTab({
        Title = "In Battle",
        Icon = "rbxassetid://4483362458"
    }),
    moneyTab = Window:AddTab({
        Title = "Money",
        Icon = "rbxassetid://4483362458"
    }),
    wormholeTab = Window:AddTab({
        Title = "Wormhole",
        Icon = "rbxassetid://4483362458"
    }),
    bossTab = Window:AddTab({
        Title = "Bosses",
        Icon = "rbxassetid://4483362458"
    }),
    teleportTab = Window:AddTab({
        Title = "Teleport",
        Icon = "rbxassetid://4483362458"
    }),
    miscTab = Window:AddTab({
        Title = "Misc",
        Icon = "rbxassetid://4483362458"
    })
}



-- Code
Tabs.welcomeTab:AddSection('[ Welcome 😁 ]')
Tabs.welcomeTab:AddParagraph({
    Title = "Welcome to Infinity Hub: "..game.Players.LocalPlayer.Name, "Have fun",
    Content = "Version 2.0.2"
})
Tabs.welcomeTab:AddParagraph({
    Title = "Discord Server",
    Content = "In Dev..."
})


Tabs.movesTab:AddSection('[ Move Replace Menu ]')
local Input = Tabs.movesTab:AddInput("Input", {
    Title = "Pokemon Name",
    Default = "",
    Placeholder = "...",
    Numeric = false,
    Finished = false,
    Callback = function(Text)
        getgenv().PokePartSelected = Text
    end
})
local Input = Tabs.movesTab:AddInput("Input", {
    Title = "Move to add",
    Default = "",
    Placeholder = "...",
    Numeric = false,
    Finished = false,
    Callback = function(Text)
        getgenv().MoveToAdd = Text
    end
})
local Input = Tabs.movesTab:AddInput("Input", {
    Title = "Move to Replace",
    Default = "",
    Placeholder = "...",
    Numeric = false,
    Finished = false,
    Callback = function(Text)
        getgenv().MoveToReplace = Text
    end
})
Tabs.movesTab:AddButton({
    Title = "Replace",
    Description = "Click to replace move",
    Callback = function()
        local ohInstance1 = game:GetService("Players").LocalPlayer.PokemonParty[getgenv().PokePartSelected]
        local ohInstance2 = game:GetService("Players").LocalPlayer.PokemonParty[getgenv().PokePartSelected].Moves[getgenv().MoveToReplace]
        local ohString3 = getgenv().MoveToAdd
        game:GetService("ReplicatedStorage").REvents.Pokemon.TMLearn:InvokeServer(ohInstance1, ohInstance2, ohString3)
    end
})
Tabs.movesTab:AddButton({
    Title = "Save",
    Description = "Save game",
    Callback = function()
        game:GetService("ReplicatedStorage").REvents.Internal.Save:InvokeServer()
    end
})


Tabs.battleTab:AddSection('[ In Battle Menu ]')
Tabs.battleTab:AddButton({
    Title = "Heal your pokemon fully",
    Description = "",
    Callback = function()
        for _, v in pairs(game:GetService("Players").LocalPlayer.PokemonParty:GetChildren()) do
            if (v:IsA('Configuration')) then
                v.CurrentHP.Value = v.Stats.HPStat.Value
            end
        end
    end
})
Tabs.battleTab:AddButton({
    Title = "Kill all enemy pokemons",
    Description = "",
    Callback = function()
        for _, v in pairs(game:GetService("Players").LocalPlayer.OppPokemon:GetDescendants()) do
            if (v:IsA('IntValue') and v.Name == 'CurrentHP') then
                v.Value = 0
            end
        end
    end
})


Tabs.moneyTab:AddSection('[ Inf Money ]')
Tabs.moneyTab:AddButton({
    Title = "Start Generate Money",
    Description = "",
    Callback = function()
        repeat task.wait()
            local a1 = 'Gary'
            game:GetService("ReplicatedStorage").REvents.Internal.jxbf:InvokeServer(a1)
        until game.Players.LocalPlayer.Character.Humanoid.Health == 9e99
    end
})
local AutoSaveToggle = Tabs.moneyTab:AddToggle("", {Title = "Auto Save Money", Default = false })
AutoSaveToggle:OnChanged(function(bool)
    autoSavemoney = bool
    while autoSavemoney do task.wait(.5)
        game:GetService("ReplicatedStorage").REvents.Internal.Save:InvokeServer()
    end
end)


Tabs.wormholeTab:AddSection('[ Wormhole Menu ]')
local TPWToggle = Tabs.wormholeTab:AddToggle("", {Title = "Teleport to Wormhole", Default = false })
TPWToggle:OnChanged(function(bool)
    findWorm = bool
    while findWorm do task.wait()
        for _, v in pairs(workspace:GetChildren()) do
            if (v:IsA('Model') and v.Name == 'Wormhole') then
                Teleport(v, true, false)
            end
        end
    end
end)
Tabs.wormholeTab:AddButton({
    Title = "Check Wormhoel",
    Description = "",
    Callback = function()
        local findPart = 'Wormhole'
        for _, v in pairs(workspace:GetChildren()) do
            if (string.find(findPart, v.Name) and v:IsA('Model')) then
                Fluent:Notify({
                    Title = "Wormhole Check Spawn",
                    Content = "Wormhole Spawned",
                    Duration = 5
                })
                return
            else
                Fluent:Notify({
                    Title = "Wormhole Check Spawn",
                    Content = "Wormhole Not Spawned",
                    Duration = 5
                })
                return
            end
        end
    end
})


Tabs.bossTab:AddSection('[ Bosses Menus ]')
local Input = Tabs.bossTab:AddInput("", {
    Title = "Enter Boss Name",
    Default = "",
    Placeholder = "...",
    Numeric = false,
    Finished = false,
    Callback = function(Text)
        getgenv().BossName = Text
    end
})
Tabs.bossTab:AddButton({
    Title = "Check Bosses",
    Description = "",
    Callback = function()
        for _, v in pairs(workspace.Bosses:GetChildren()) do
            if v:IsA('Model') then
                Fluent:Notify({
                    Title = "Bosses Check",
                    Content = "Boss Name: "..v.Name,
                    Duration = 5
                })
            end
        end
    end
})
Tabs.bossTab:AddButton({
    Title = "Teleport Boss Selected",
    Description = "",
    Callback = function()
        Teleport(workspace.Bosses[getgenv().BossName], true, false)
    end
})


Tabs.teleportTab:AddSection('[ Teleport Menu ]')
local teleportNpc = {'Brock','Misty','Surge','Erika','Koga','Sabrina','Blaine','GiovanniBoss','Marie','Nicu','Leader Total','Leader Pop'}
for _, v in next, teleportNpc do
    Tabs.teleportTab:AddButton({
        Title = "Teleport to "..v,
        Description = "",
        Callback = function()
            Teleport(workspace[v], true, false)
        end
    })
end


Tabs.miscTab:AddSection('[ Misc Options ]')
Tabs.miscTab:AddButton({
    Title = "Rejoin Small Server",
    Description = "",
    Callback = function()
        local Http = game:GetService("HttpService")
        local TPS = game:GetService("TeleportService")
        local Api = "https://games.roblox.com/v1/games/"
        local _place = game.PlaceId
        local _servers = Api.._place.."/servers/Public?sortOrder=Asc&limit=100"
        function ListServers(cursor)
          local Raw = game:HttpGet(_servers .. ((cursor and "&cursor="..cursor) or ""))
          return Http:JSONDecode(Raw)
        end
        local Server, Next; repeat
          local Servers = ListServers(Next)
          Server = Servers.data[1]
          Next = Servers.nextPageCursor
        until Server
        TPS:TeleportToPlaceInstance(_place, Server.id, game.Players.LocalPlayer)
    end
})
Tabs.miscTab:AddButton({
    Title = "Open Taxi Gui",
    Description = "",
    Callback = function()
        game:GetService("Players").LocalPlayer.PlayerGui.Main.Taxi.Visible = true
    end
})
local AutoSaveGameToggle = Tabs.miscTab:AddToggle("", {Title = "Auto Save Game (6 seconds)", Default = false })
AutoSaveGameToggle:OnChanged(function(bool)
    autoSaveGame = bool
    while autoSaveGame do task.wait(6)
        game:GetService("ReplicatedStorage").REvents.Internal.Save:InvokeServer()
    end
end)



-- Select Tab
Window:SelectTab(1)
