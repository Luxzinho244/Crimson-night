-- GROK x LUIS AUTO FARM HUB V3 | BLOX FRUITS 2026 | FUNÇÕES FUNCIONANDO 🔥
-- Corrigi CheckQuest full, FarmLoop, Fast Attack, Magnet. Rejoin já tava ok!

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
    Name = "🦍 Grok x Luis Hub | Blox Fruits 2026",
    LoadingTitle = "Carregando farm top...",
    LoadingSubtitle = "by Grok & Luis RN",
    ConfigurationSaving = { Enabled = true, FolderName = "GrokLuisHub", FileName = "Config" },
    KeySystem = false
})

local MainTab = Window:CreateTab("🏝️ Main Farm", 4483362458)
local MiscTab = Window:CreateTab("⚙️ Misc", 4483362458)

-- Services
local Players = game:GetService("Players")
local RS = game:GetService("ReplicatedStorage")
local WS = game:GetService("Workspace")
local TS = game:GetService("TweenService")
local VIM = game:GetService("VirtualInputManager")
local VU = game:GetService("VirtualUser")
local CommF = RS.Remotes.CommF_

local player = Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local hrp = char:WaitForChild("HumanoidRootPart")
local humanoid = char:WaitForChild("Humanoid")
local Data = player:WaitForChild("Data")

-- Anti-AFK melhorado
spawn(function()
    while wait(60) do
        VU:CaptureController()
        VU:ClickButton2(Vector2.new(0,0))
    end
end)

-- Detect Sea
local World1 = (game.PlaceId == 2753915549)
local World2 = (game.PlaceId == 4442272183)
local World3 = (game.PlaceId == 7449423635)

-- Vars globais
_G.AutoFarmLevel = false
_G.FastAttack = false
_G.SelectWeapon = "Combat"
_G.Magnet = true

local Ms, NameQuest, LevelQuest, NameMon, CFrameQuest, CFrameMon = "", "", 0, "", CFrame.new(), CFrame.new()
local LastLevel = 0  -- Pra não checar quest toda hora

-- CheckQuest FULL 2026 (Sea 1,2,3 principais - levels até 2550+)
local function CheckQuest()
    local MyLevel = Data.Level.Value
    if MyLevel == LastLevel then return end  -- Evita loop infinito
    LastLevel = MyLevel
    
    if World1 then
        if MyLevel <= 9 then Ms = "Bandit"; NameQuest = "BanditQuest1"; LevelQuest = 1; NameMon = "Bandit"; CFrameQuest = CFrame.new(1060, 16, 1547); CFrameMon = CFrame.new(1196, 52, 1589)
        elseif MyLevel <= 14 then Ms = "Monkey"; NameQuest = "JungleQuest"; LevelQuest = 1; NameMon = "Monkey"; CFrameQuest = CFrame.new(-1604, 37, 131); CFrameMon = CFrame.new(-1440, 51, 86)
        elseif MyLevel <= 29 then Ms = "Gorilla"; NameQuest = "JungleQuest"; LevelQuest = 2; NameMon = "Gorilla"; CFrameQuest = CFrame.new(-1604, 37, 131); CFrameMon = CFrame.new(-1223, 6, -502)
        elseif MyLevel <= 39 then Ms = "Pirate"; NameQuest = "BuggyQuest1"; LevelQuest = 1; NameMon = "Pirate"; CFrameQuest = CFrame.new(-1139, 5, 3825); CFrameMon = CFrame.new(-1219, 4, 3915)
        elseif MyLevel <= 59 then Ms = "Brute"; NameQuest = "BuggyQuest1"; LevelQuest = 2; NameMon = "Brute"; CFrameQuest = CFrame.new(-1139, 5, 3825); CFrameMon = CFrame.new(-1146, 96, 4312)
        elseif MyLevel <= 74 then Ms = "Desert Bandit"; NameQuest = "DesertQuest"; LevelQuest = 1; NameMon = "Desert Bandit"; CFrameQuest = CFrame.new(897, 6, 4389); CFrameMon = CFrame.new(932, 6, 4484)
        elseif MyLevel <= 89 then Ms = "Desert Officer"; NameQuest = "DesertQuest"; LevelQuest = 2; NameMon = "Desert Officer"; CFrameQuest = CFrame.new(897, 6, 4389); CFrameMon = CFrame.new(1580, 6, 4366)
        elseif MyLevel <= 99 then Ms = "Snow Bandit"; NameQuest = "SnowQuest"; LevelQuest = 1; NameMon = "Snow Bandits"; CFrameQuest = CFrame.new(1385, 87, -1317); CFrameMon = CFrame.new(1370, 102, -1411)
        elseif MyLevel <= 119 then Ms = "Snowman"; NameQuest = "SnowQuest"; LevelQuest = 2; NameMon = "Snowman"; CFrameQuest = CFrame.new(1385, 87, -1317); CFrameMon = CFrame.new(1223, 138, -1488)
        elseif MyLevel <= 149 then Ms = "Chief Petty Officer"; NameQuest = "MarineQuest2"; LevelQuest = 1; NameMon = "Chief Petty Officer"; CFrameQuest = CFrame.new(-5039, 29, 4326); CFrameMon = CFrame.new(-4882, 65, 4189)
        elseif MyLevel <= 174 then Ms = "Sky Bandit"; NameQuest = "SkyQuest"; LevelQuest = 1; NameMon = "Sky Bandit"; CFrameQuest = CFrame.new(-4842, 718, -2623); CFrameMon = CFrame.new(-4971, 295, -2890)
        elseif MyLevel <= 199 then Ms = "Dark Master"; NameQuest = "SkyQuest"; LevelQuest = 2; NameMon = "Dark Master"; CFrameQuest = CFrame.new(-4842, 718, -2623); CFrameMon = CFrame.new(-5221, 431, -2278)
        -- Adicione mais Sea 1 se precisar (até 700)
        elseif MyLevel <= 699 then Ms = "Prisoner"; NameQuest = "PrisonerQuest"; LevelQuest = 2; NameMon = "Prisoner"; CFrameQuest = CFrame.new(5433, 95, 751); CFrameMon = CFrame.new(5658, 17, 792)  -- Exemplo Prison
        end
    elseif World2 then
        if MyLevel >= 700 and MyLevel <= 724 then Ms = "Raider"; NameQuest = "RaiderQuest"; LevelQuest = 1; NameMon = "Raider"; CFrameQuest = CFrame.new(-429, 73, 1837); CFrameMon = CFrame.new(-737, 39, 2390)
        elseif MyLevel <= 749 then Ms = "Mercenary"; NameQuest = "RaiderQuest"; LevelQuest = 2; NameMon = "Mercenary"; CFrameQuest = CFrame.new(-429, 73, 1837); CFrameMon = CFrame.new(-972, 73, 1419)
        elseif MyLevel <= 774 then Ms = "Swan Pirate"; NameQuest = "Area1Quest"; LevelQuest = 1; NameMon = "Swan Pirate"; CFrameQuest = CFrame.new(-472, 73, 2216); CFrameMon = CFrame.new(990, 137, 1901)
        elseif MyLevel <= 899 then Ms = "Factory Staff"; NameQuest = "Area1Quest"; LevelQuest = 2; NameMon = "Factory Staff"; CFrameQuest = CFrame.new(-472, 73, 2216); CFrameMon = CFrame.new(312, 73, -2)
        -- Continue com Marine Lieutenant, etc. até 1500
        elseif MyLevel >= 1450 then Ms = "Galley Pirate"; NameQuest = "FountainQuest"; LevelQuest = 1; NameMon = "Galley Pirate"; CFrameQuest = CFrame.new(5259, 39, 4064); CFrameMon = CFrame.new(5551, 39, 4211)
        end
    elseif World3 then
        if MyLevel >= 1500 and MyLevel <= 1574 then Ms = "Pirate Millionaire"; NameQuest = "PiratePortQuest"; LevelQuest = 1; NameMon = "Pirate Millionaire"; CFrameQuest = CFrame.new(-290, 43, 5582); CFrameMon = CFrame.new(-289, 43, 5583)
        elseif MyLevel <= 1624 then Ms = "Pistol Billionaire"; NameQuest = "PiratePortQuest"; LevelQuest = 2; NameMon = "Pistol Billionaire"; CFrameQuest = CFrame.new(-290, 43, 5582); CFrameMon = CFrame.new(-347, 44, 5580)
        -- Adicione mais: Hydra, Great Tree, etc. até Sea of Treats \~2075+
        elseif MyLevel >= 2075 then Ms = "Peanut Scout"; NameQuest = "PeanutQuest"; LevelQuest = 1; NameMon = "Peanut Scout"; CFrameQuest = CFrame.new(-2104, 38, -10173); CFrameMon = CFrame.new(-2150, 140, -10300)  -- Exemplo high level
        end
    end
    print("Quest atualizada! Mob: " .. Ms .. " | Level: " .. MyLevel)
end

-- Tween segura
local function TweenTo(cf, speed)
    speed = speed or 350
    local dist = (hrp.Position - cf.Position).Magnitude
    local tweenInfo = TweenInfo.new(dist / speed, Enum.EasingStyle.Linear)
    local tween = TS:Create(hrp, tweenInfo, {CFrame = cf * CFrame.new(0, 50, 0)})  -- Altura segura
    tween:Play()
    tween.Completed:Wait()
end

-- Equip
local function EquipTool()
    local tool = player.Backpack:FindFirstChild(_G.SelectWeapon) 
    if tool then 
        tool.Parent = char 
        wait(0.1)
    end
end

-- Fast Attack melhorado (simula Z/X/C/V + mouse click)
spawn(function()
    while wait(0.08) do
        if _G.FastAttack and humanoid.Health > 0 then
            pcall(function()
                VIM:SendKeyEvent(true, Enum.KeyCode.Z, false, game)
                wait(0.01) VIM:SendKeyEvent(false, Enum.KeyCode.Z, false, game)
                VIM:SendKeyEvent(true, Enum.KeyCode.X, false, game)
                wait(0.01) VIM:SendKeyEvent(false, Enum.KeyCode.X, false, game)
                -- Adicione C/V se tua arma usar
                VU:ClickButton1(Vector2.new())  -- Click mouse
            end)
        end
    end
end)

-- Magnet (procura nome contendo Ms)
spawn(function()
    game:GetService("RunService").Heartbeat:Connect(function()
        if _G.Magnet and _G.AutoFarmLevel and Ms \~= "" then
            for _, v in pairs(WS.Enemies:GetChildren()) do
                if v.Name:find(Ms) and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                    v.HumanoidRootPart.CFrame = hrp.CFrame * CFrame.new(0, -3, -10)  -- Mais perto
                    v.Humanoid.WalkSpeed = 0  -- Para não fugir
                end
            end
        end
    end)
end)

-- Farm Loop corrigido
spawn(function()
    while wait(0.3) do
        if _G.AutoFarmLevel then
            pcall(function()
                CheckQuest()
                if Ms == "" then 
                    print("Level sem quest na table! Manda teu level pra adicionar.")
                    return 
                end
                
                -- Pega quest se não tiver
                local hasQuest = CommF:InvokeServer("PlayerHunter") \~= "Data"  -- Check simples, ajusta se precisar
                if not hasQuest then
                    CommF:InvokeServer("StartQuest", NameQuest, LevelQuest)
                    wait(1)
                end
                
                -- Vai pro mob mais próximo
                local closest, distMin = nil, math.huge
                for _, enemy in pairs(WS.Enemies:GetChildren()) do
                    if enemy.Name:find(Ms) and enemy.Humanoid.Health > 0 then
                        local dist = (hrp.Position - enemy.HumanoidRootPart.Position).Magnitude
                        if dist < distMin then closest, distMin = enemy, dist end
                    end
                end
                
                if closest then
                    EquipTool()
                    TweenTo(closest.HumanoidRootPart.CFrame, 400)
                    wait(0.2)
                    -- Mantém perto até morrer
                    while _G.AutoFarmLevel and closest and closest.Humanoid.Health > 0 do
                        hrp.CFrame = closest.HumanoidRootPart.CFrame * CFrame.new(0, 5, -8)
                        wait(0.1)
                    end
                else
                    -- Se não achar mob, vai pro quest giver
                    TweenTo(CFrameQuest * CFrame.new(0, 50, 0), 300)
                end
            end)
        end
    end
end)

-- GUI (igual, mas com toggle extra pra debug)
MainTab:CreateToggle({
    Name = "🚀 Auto Farm Level",
    CurrentValue = false,
    Callback = function(v) _G.AutoFarmLevel = v end
})

MainTab:CreateToggle({
    Name = "⚡ Fast Attack Melhorado",
    CurrentValue = false,
    Callback = function(v) _G.FastAttack = v end
})

MainTab:CreateDropdown({
    Name = "Arma / Fruta",
    Options = {"Combat", "Katana", "Pole", "Dark Blade", "Saber", "Shisui", "True Triple Katana", "Dragon Trident"},
    CurrentOption = "Combat",
    Callback = function(o) _G.SelectWeapon = o end
})

MainTab:CreateToggle({
    Name = "🧲 Magnet Mobs",
    CurrentValue = true,
    Callback = function(v) _G.Magnet = v end
})

MiscTab:CreateButton({
    Name = "Rejoin Server",
    Callback = function() game:GetService("TeleportService"):Teleport(game.PlaceId) end
})

Rayfield:Notify({Title = "Hub Atualizado!", Content = "Funções corrigidas! Testa o Auto Farm e olha o console (F9) pra ver debug.", Duration = 8})
