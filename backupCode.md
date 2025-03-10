-- spawn button

-- local function teleportToSpawn()
--     local player = game:GetService("Players").LocalPlayer
--     local character = player.Character or player.CharacterAdded:Wait()
--     local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")

--     if humanoidRootPart then
--         -- Find the SpawnLocation in the game
--         local spawnLocation = game.Workspace:FindFirstChildOfClass("SpawnLocation")
        
--         if spawnLocation then
--             -- Move the character to the spawn point instantly
--             humanoidRootPart.CFrame = spawnLocation.CFrame + Vector3.new(0, 3, 0) -- Slightly above the spawn point
--         else
--             Rayfield:Notify({
--                 Title = "Spawn Error",
--                 Content = "No SpawnLocation found in the game!",
--                 Duration = 3,
--             })
--         end
--     end
-- end

-- local RespawnButton = MainTab:CreateButton({
--     Name = "Instant Spawn at Spawn Point",
--     Callback = function()
--         teleportToSpawn()

--         -- Notify user
--         Rayfield:Notify({
--             Title = "Teleported!",
--             Content = "You have been instantly moved to the spawn point.",
--             Duration = 3,
--         })
--     end
-- })

-- AUTO Move Forward

-- local AutoWalkButton = MainTab:CreateButton({
--     Name = "Move Forward (350 Steps)",
--     Callback = function()
--         local player = game:GetService("Players").LocalPlayer
--         local character = player.Character or player.CharacterAdded:Wait()
--         local humanoid = character:FindFirstChildOfClass("Humanoid")

--         if humanoid then
--             local stepCount = 0
--             local maxSteps = 350  -- Fixed value of 550 steps
            
--             local connection
--             connection = game:GetService("RunService").RenderStepped:Connect(function()
--                 if stepCount < maxSteps then
--                     humanoid:Move(Vector3.new(0, 0, -1), true) -- Move forward one step
--                     stepCount = stepCount + 1
--                 else
--                     connection:Disconnect() -- Stop moving after 550 steps
--                 end
--             end)

--             -- Notify user
--             Rayfield:Notify({
--                 Title = "Move Forward",
--                 Content = "Moved 550 steps forward!",
--                 Duration = 3,
--             })
--         else
--             Rayfield:Notify({
--                 Title = "Error",
--                 Content = "Character not found!",
--                 Duration = 3,
--             })
--         end
--     end
-- })


-- local AutoWalkButton = MainTab:CreateButton({
--     Name = "Move Forward (350 Steps on Z-Axis)",
--     Callback = function()
--         local player = game:GetService("Players").LocalPlayer
--         local character = player.Character or player.CharacterAdded:Wait()
--         local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")

--         if humanoidRootPart then
--             local stepCount = 0
--             local maxSteps = 100  -- Move exactly 350 steps forward on Z-axis
            
--             local connection
--             connection = game:GetService("RunService").RenderStepped:Connect(function()
--                 if stepCount < maxSteps then
--                     humanoidRootPart.CFrame = humanoidRootPart.CFrame * CFrame.new(0, 0, -1) -- Moves forward along Z-axis
--                     stepCount = stepCount + 1
--                 else
--                     connection:Disconnect() -- Stop moving after 350 steps
--                 end
--             end)

--             -- Notify user
--             Rayfield:Notify({
--                 Title = "Move Forward",
--                 Content = "Moved 350 steps forward on Z-axis!",
--                 Duration = 2,
--             })
--         else
--             Rayfield:Notify({
--                 Title = "Error",
--                 Content = "Character's HumanoidRootPart not found!",
--                 Duration = 2,
--             })
--         end
--     end
-- })





