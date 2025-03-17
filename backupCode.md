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


----------------------- ULTRA LOW NO DISBALE----------------------------------------------




local LowFPSModeEnabled = false

local LowFPSButton = MainTab:CreateButton({
    Name = "Enable MAX FPS Mode",
    Callback = function()
        if LowFPSModeEnabled then
            Rayfield:Notify({
                Title = "Low FPS Mode",
                Content = "Already Enabled!",
                Duration = 3
            })
            return
        end

        LowFPSModeEnabled = true

        -- Get Services
        local lighting = game:GetService("Lighting")
        local terrain = workspace:FindFirstChildOfClass("Terrain")

        -- 💥 Remove ALL Lighting Effects 💥
        lighting.GlobalShadows = false
        lighting.Brightness = 0
        lighting.Ambient = Color3.new(0, 0, 0)
        lighting.OutdoorAmbient = Color3.new(0, 0, 0)
        lighting.FogEnd = 0
        lighting.FogStart = 0
        lighting.ClockTime = 12
        for _, v in ipairs(lighting:GetChildren()) do
            v:Destroy() -- Deletes all light instances
        end

        -- 💥 Completely Flatten Terrain 💥
        if terrain then
            terrain.WaterWaveSize = 0
            terrain.WaterWaveSpeed = 0
            terrain.WaterReflectance = 0
            terrain.WaterTransparency = 1
            terrain.Decoration = false
            terrain:Clear() -- Deletes all terrain
        end

        -- 💥 MASS DISABLE ALL VISUALS 💥
        for _, v in ipairs(workspace:GetDescendants()) do
            if v:IsA("ParticleEmitter") or v:IsA("Beam") or v:IsA("Trail") or v:IsA("Smoke") or v:IsA("Fire") or v:IsA("Sparkles") then
                v:Destroy() -- Deletes all particles and effects
            elseif v:IsA("PointLight") or v:IsA("SpotLight") or v:IsA("SurfaceLight") then
                v:Destroy() -- Deletes all light sources
            elseif v:IsA("Texture") or v:IsA("Decal") then
                v:Destroy() -- Removes ALL textures
            elseif v:IsA("MeshPart") or v:IsA("UnionOperation") then
                v.Material = Enum.Material.SmoothPlastic
                v.Reflectance = 0
                v.TextureID = "" -- Removes mesh textures
            elseif v:IsA("Shirt") or v:IsA("Pants") or v:IsA("CharacterMesh") or v:IsA("Accessory") then
                v:Destroy() -- Removes all player accessories & clothing
            end
        end

        -- 💥 DELETE ALL GUI ELEMENTS 💥
        for _, v in ipairs(game:GetService("Players").LocalPlayer.PlayerGui:GetDescendants()) do
            if v:IsA("ImageLabel") or v:IsA("Frame") or v:IsA("TextLabel") or v:IsA("ScrollingFrame") or v:IsA("TextButton") then
                v:Destroy() -- Removes UI for max performance
            end
        end

        -- 💥 REMOVE ALL ANIMATIONS 💥
        for _, v in ipairs(workspace:GetDescendants()) do
            if v:IsA("Animation") or v:IsA("Animator") or v:IsA("AnimationController") then
                v:Destroy() -- Deletes all animations
            end
        end

        -- 💥 DISABLE ALL PHYSICS OBJECTS 💥
        for _, v in ipairs(workspace:GetDescendants()) do
            if v:IsA("HingeConstraint") or v:IsA("BallSocketConstraint") or v:IsA("RopeConstraint") or v:IsA("SpringConstraint") or v:IsA("RodConstraint") then
                v:Destroy() -- Removes physics-based objects
            end
        end

        -- 💥 DELETE ALL SOUNDS 💥
        for _, v in ipairs(workspace:GetDescendants()) do
            if v:IsA("Sound") then
                v:Destroy() -- Removes ALL sounds
            end
        end

        -- Notify User
        Rayfield:Notify({
            Title = "MAX FPS Mode",
            Content = "Game Graphics Reduced to Absolute Minimum! Maximum FPS Boost Applied.",
            Duration = 3
        })
    end
})


----------------------- OLD LOW FPS CODE -------------

-- lower fps

-- local LowFPSModeEnabled = false

-- local LowFPSButton = MainTab:CreateToggle({
--     Name = "Low FPS Mode",
--     Callback = function()
--         LowFPSModeEnabled = not LowFPSModeEnabled -- Toggle state

--         -- Get Graphics Settings
--         local lighting = game:GetService("Lighting")
--         local terrain = workspace:FindFirstChildOfClass("Terrain")

--         if LowFPSModeEnabled then
--             -- Reduce Lighting Effects
--             lighting.GlobalShadows = false
--             lighting.Brightness = 0
--             lighting.FogEnd = 0

--             -- Lower Terrain Quality
--             if terrain then
--                 terrain.WaterWaveSize = 0
--                 terrain.WaterWaveSpeed = 0
--                 terrain.WaterReflectance = 0
--                 terrain.WaterTransparency = 1
--             end

--             -- Lower other graphic-intensive settings
--             for _, v in ipairs(workspace:GetDescendants()) do
--                 if v:IsA("ParticleEmitter") or v:IsA("Beam") or v:IsA("Trail") then
--                     v.Enabled = false -- Disable extra visual effects
--                 end
--             end

--         else
--             -- Restore Default Graphics
--             lighting.GlobalShadows = true
--             lighting.Brightness = 2
--             lighting.FogEnd = 100000

--             if terrain then
--                 terrain.WaterWaveSize = 1
--                 terrain.WaterWaveSpeed = 1
--                 terrain.WaterReflectance = 1
--                 terrain.WaterTransparency = 0.5
--             end

--             -- Re-enable effects
--             for _, v in ipairs(workspace:GetDescendants()) do
--                 if v:IsA("ParticleEmitter") or v:IsA("Beam") or v:IsA("Trail") then
--                     v.Enabled = true -- Restore effects
--                 end
--             end
--         end

--         -- Notify User
--         Rayfield:Notify({
--             Title = "Low FPS Mode",
--             Content = "Low FPS Mode is now " .. (LowFPSModeEnabled and "Enabled" or "Disabled"),
--             Duration = 3
--         })
--     end
-- })