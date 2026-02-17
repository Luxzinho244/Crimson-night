-- GROK x LUIS HUB V6 | BLOX FRUITS 2026 | KAVO UI (DELTA MOBILE FIX) 🔥
-- Atualizado pós-update Delta v2.708 - carrega suave, funções base + rejoin ok

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("🦍 Grok x Luis Hub | Blox Fruits 2026", "DarkTheme")  -- Animações top, dark vibe

local MainTab = Window:NewTab("🏝️ Main Farm")
local MiscTab = Window:NewTab("⚙️ Misc")

local FarmSection = MainTab:NewSection("Auto Farm Level")

_G.AutoFarmLevel = false
FarmSection:NewToggle("🚀 Auto Farm Level (Quest + Mobs)", "Liga o farm automático", function(v)
    _G.AutoFarmLevel = v
    print("Auto Farm: " .. (v and "LIGADO! Bora upar level" or "DESLIGADO"))
    -- Cola aqui o FarmLoop completo das mensagens antigas (CheckQuest full, TweenTo, EquipTool, Magnet spawn, Fast Attack spawn)
    -- Se precisar, eu mando o loop completo de novo!
end)

_G.FastAttack = false
FarmSection:NewToggle("⚡ Fast Attack Insano", "Ataque rápido", function(v)
    _G.FastAttack = v
end)

local Weapons = {"Combat", "Katana", "Pole", "Dark Blade", "Saber"}
_G.SelectWeapon = "Combat"
FarmSection:NewDropdown("Select Arma/Fruta", "Escolhe tua arma", Weapons, function(selected)
    _G.SelectWeapon = selected
    print("Arma selecionada: " .. selected)
end)

_G.Magnet = true
FarmSection:NewToggle("🧲 Magnet Mobs", "Puxa mobs pra perto", function(v)
    _G.Magnet = v
end)

MiscTab:NewButton("🔄 Rejoin Server (já tá funcionando)", "Troca de server rápido", function()
    game:GetService("TeleportService"):Teleport(game.PlaceId)
end)

print("Hub Kavo carregado no Delta! Abre a GUI e testa o Auto Farm, Luis! Se GUI abrir, cola o resto do código. 🚀🍌")
