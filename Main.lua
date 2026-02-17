--// 🩸 CRIMSON NIGHT V3
--// by Luis RN

if _G.CrimsonLoaded then
    return warn("Crimson Night já está rodando.")
end
_G.CrimsonLoaded = true

local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()
local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")
local LocalPlayer = Players.LocalPlayer

--// Estados
local States = {
    AutoFarm = false,
    AutoQuest = false
}

--// Funções
local Functions = {}

function Functions:StartAutoFarm()
    States.AutoFarm = true
    task.spawn(function()
        while States.AutoFarm do
            print("AutoFarm ativo...")
            task.wait(1)
        end
    end)
end

function Functions:StopAutoFarm()
    States.AutoFarm = false
end

function Functions:StartAutoQuest()
    States.AutoQuest = true
    task.spawn(function()
        while States.AutoQuest do
            print("AutoQuest ativo...")
            task.wait(1)
        end
    end)
end

function Functions:StopAutoQuest()
    States.AutoQuest = false
end

--// Window
local Window = Rayfield:CreateWindow({
    Name = "🩸 Crimson Night",
    LoadingTitle = "Crimson Night",
    LoadingSubtitle = "by Luis RN",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "CrimsonNight",
        FileName = "Config"
    },
    KeySystem = false
})

--// Main Tab
local Main = Window:CreateTab("Main", 4483362458)

Main:CreateToggle({
    Name = "Auto Farm",
    CurrentValue = false,
    Callback = function(Value)
        if Value then
            Functions:StartAutoFarm()
        else
            Functions:StopAutoFarm()
        end
    end
})

Main:CreateToggle({
    Name = "Auto Quest",
    CurrentValue = false,
    Callback = function(Value)
        if Value then
            Functions:StartAutoQuest()
        else
            Functions:StopAutoQuest()
        end
    end
})

Main:CreateButton({
    Name = "Rejoin Server",
    Callback = function()
        TeleportService:Teleport(game.PlaceId, LocalPlayer)
    end
})

Rayfield:Notify({
    Title = "🩸 Crimson Night",
    Content = "Funções carregadas com sucesso.",
    Duration = 5
})
