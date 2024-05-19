local Material = loadstring(game:HttpGet("https://raw.githubusercontent.com/JustLevel/working-newbie/main/Material.lua"))()
local SettingsLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/JustLevel/working-newbie/main/SaveSettingsLibrary.lua"))()
local InputLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/JustLevel/working-newbie/main/InputFunctionsLibrary"))()
local Player = game.Players.LocalPlayer

local FileName = "AHeroDestiny.GoombaHub"
local SettingsTable = SettingsLibrary.LoadSettings(FileName)

local GoombaHub = Material.Load({
    Title = "Goomba Hub",
    Style = 1,
    SizeX = 250,
    SizeY = 350,
    Theme = "Dark",
})

local AutoFarmTab = GoombaHub.New({
    Title = "AutoFarm"
})

local function RemoteAttack(Number, AttackPosition)
    local class = Player.Stats.Class.Value
    if class == "Angel" then
        Player.Stats.Class.Value = "Puri Puri"
    elseif class == "Toxin" then
        Player.Stats.Class.Value = "Broly"
    end
    
    local ClassString = string.gsub(Player.Stats.Class.Value, " ", "")
    local AttackArg = ClassString.."Attack"..tostring(Number)
    game:GetService("ReplicatedStorage").RemoteEvent:FireServer(AttackArg, AttackPosition)
end

Player.CharacterAdded:Connect(function()
    task.wait(2)
    RemoteAttack(6)
end)

local BossTable = {}
AutoFarmTab.Toggle({
	Text = "Autofarm",
	Callback = function(Value)
		SettingsTable.AutoFarm = Value
        if Player.Character:FindFirstChild("Form") and (Player.Character.Form.Value == "") then
            RemoteAttack(6)
        end
        coroutine.wrap(function()
            while SettingsTable.AutoFarm do task.wait()
                for i, v in pairs(BossTable) do
                    if v and SettingsTable.AutoFarm then
                        local Npc = workspace.Spawns:FindFirstChild(i):FindFirstChild(i)
                        if Npc and Npc:FindFirstChild("Humanoid") and not (Npc.Humanoid.Health == 0) then
                            for i1, v1 in pairs(require(game:GetService("ReplicatedStorage").Modules.Quests)) do
                                if v1.Target == i then
                                    for _, Folder in pairs(Player:GetChildren()) do
                                        if Folder:IsA("Folder") and (Folder.Name == "Quest") then
                                            Folder:Destroy()
                                        end
                                    end
                                    game:GetService("ReplicatedStorage").RemoteEvent:FireServer("GetQuest", i1)
                                    Player:WaitForChild("Quest")
                                    break
                                end
                            end
                            local EHum = Npc:WaitForChild("Humanoid")
                            local EHrp = Npc:WaitForChild("HumanoidRootPart")
                            while SettingsTable.AutoFarm do task.wait()
                                local Char = Player.Character or Player.CharacterAdded:Wait()
                                local Hrp = Char:WaitForChild("HumanoidRootPart")
                                if EHum.Health == 0 then
                                    break
                                end
                                Hrp.CFrame = CFrame.new(EHrp.Position - EHrp.CFrame.LookVector * 3, EHrp.Position)
                                InputLibrary.VirtualCenterMouseClick()
                                for Number=1, 5 do
                                    RemoteAttack(Number, EHrp.Position)
                                end
                            end
                        end
                    end
                end
            end
        end)()
	end,
	Enabled = SettingsTable.AutoFarm
})

for i, v in pairs(require(game:GetService("ReplicatedStorage").Modules.Quests)) do
    if v.Amount == 1 then
        BossTable[v.Target] = false
    end
end

if SettingsTable.SavedTable then
    for i, v in pairs(BossTable) do
        if not SettingsTable.SavedTable[i] then
            SettingsTable.SavedTable[i] = false
        end
    end
else
    SettingsTable.SavedTable = BossTable
end

AutoFarmTab.DataTable({
	Text = "Chipping away",
	Callback = function(ChipSet)
        for i, v in pairs(ChipSet) do
            BossTable[i] = v
            SettingsTable.SavedTable[i] = v
        end
	end,
	Options = SettingsTable.SavedTable
})

local SpinTab = GoombaHub.New({
    Title = "AutoSpin"
})

local SpinTable = {}
for i, v in pairs(require(game:GetService("ReplicatedStorage").Modules.Classes).Lucky) do
    SpinTable[v.Item] = false
end

local SpinToggle = SpinTab.Toggle({
    Text = "AutoSpin",
    Callback = function(Value)
        SettingsTable.AutoSpin = Value
        
        coroutine.wrap(function()
            while SettingsTable.AutoSpin do
                task.wait()
                game:GetService("ReplicatedStorage").RemoteFunction:InvokeServer()
                for i, v in pairs(SpinTable) do
                    if SpinTable[Player.Stats.Class.Value] then
                        SpinToggle:SetState(false)
                        break
                    end
                end
            end
        end)()
    end,
    Enabled = SettingsTable.AutoSpin
})

SpinTab.DataTable({
    Text = "Chipping away",
    Callback = function(ChipSet)
        for i, v in pairs(ChipSet) do
            SpinTable[i] = v
        end
    end,
    Options = SpinTable
})

local MiscTab = GoombaHub.New({
    Title = "Misc"
})

local function ToggleAutoHealth(Value)
    SettingsTable.AutoHealth = Value
    if Value then
        coroutine.wrap(function()
            while Value do
                task.wait(0.5)
                local HealthValue = game.Players.LocalPlayer.Stats.Attributes.Value
                if HealthValue > 0 then
                    local args = {
                        "UpgradeHealth",
                        HealthValue
                    }
                    game:GetService("ReplicatedStorage").RemoteEvent:FireServer(unpack(args))
                    task.wait(0.1)
                end
            end
        end)()
    end
    SettingsLibrary.SaveSettings(FileName, SettingsTable)
end

local UpgradeHealthToggle = MiscTab.Toggle({
    Text = "Auto Health",
    Callback = ToggleAutoHealth,
    Enabled = SettingsTable.AutoHealth or false
})

local function ToggleAutoStamina(Value)
    SettingsTable.AutoStamina = Value
    if Value then
        coroutine.wrap(function()
            while Value do
                task.wait(0.5)
                local StaminaValue = game.Players.LocalPlayer.Stats.Attributes.Value
                if StaminaValue > 0 then
                    local args = {
                        "UpgradeStamina",
                        StaminaValue
                    }
                    game:GetService("ReplicatedStorage").RemoteEvent:FireServer(unpack(args))
                    task.wait(0.1)
                end
            end
        end)()
    end
    SettingsLibrary.SaveSettings(FileName, SettingsTable)
end

local UpgradeStaminaToggle = MiscTab.Toggle({
    Text = "Auto Stamina",
    Callback = ToggleAutoStamina,
    Enabled = SettingsTable.AutoStamina or false
})

local function PC()
    if Player:FindFirstChild("IsMobile") then
        Player.IsMobile:Destroy()
        if Player.Character and Player.Character:FindFirstChild("Humanoid") then
            Player.Character.Humanoid.Health = 0
        end
    end
end

local RemoveMButton = MiscTab.Button({
    Text = "Get PC Mode",
    Callback = PC
})

game.Players.PlayerRemoving:Connect(function(PlayerRemoving)
    if PlayerRemoving == Player then
        SettingsLibrary.SaveSettings(FileName, SettingsTable)
    end
end)
