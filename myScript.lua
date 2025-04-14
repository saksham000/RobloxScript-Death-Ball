local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "❤ Death Ball Script By Saxam ❤",
    Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
    LoadingTitle = "SAXAM's Script",
    LoadingSubtitle = "by Saxam",
    Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes

    DisableRayfieldPrompts = false,
    DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

    ConfigurationSaving = {
        Enabled = false,
        
        FolderName = nil, -- Create a custom folder for your hub/game
        FileName = "SaxamScripts"
    },

    Discord = {
        Enabled = false,         -- Prompt the user to join your Discord server if their executor supports it
        Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
        RememberJoins = true     -- Set this to false to make them join the discord every time they load it up
    },

    KeySystem = false, -- Set this to true to use our key system
    KeySettings = {
        Title = "Untitled",
        Subtitle = "Key System",
        Note = "No method of obtaining the key is provided", -- Use this to tell the user how to get a key
        FileName = "Key",                                    -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
        SaveKey = true,                                      -- The user's key will be saved, but if you change the key, they will be unable to use your script
        GrabKeyFromSite = false,                             -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
        Key = { "Hello" }                                    -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
    }
})

local MainTab = Window:CreateTab("🎇 Home", nil) -- Title, Image
local MainSection = MainTab:CreateSection("Main")

Rayfield:Notify({
    Title = "Script is Executed",
    Content = "Loading gui",
    Duration = 5,
    Image = nil
})

local InfiniteJumpEnabled = false
local JumpConnection -- Store the connection so we can properly disconnect it

local Button = MainTab:CreateToggle({
    Name = "Infinite Jump",
    Callback = function()
        if InfiniteJumpEnabled then
            -- Disable Infinite Jump
            InfiniteJumpEnabled = false
            if JumpConnection then
                JumpConnection:Disconnect() -- Properly disconnect previous event
                JumpConnection = nil
            end
        else
            -- Enable Infinite Jump
            InfiniteJumpEnabled = true
            JumpConnection = game:GetService("UserInputService").JumpRequest:Connect(function()
                local humanoid = game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                if humanoid then
                    humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                end
            end)
        end

        -- Notify user
        Rayfield:Notify({
            Title = "Infinite Jump",
            Content = "Infinite Jump is now " .. (InfiniteJumpEnabled and "Enabled" or "Disabled"),
            Duration = 3
        })
    end
})

local WalkThroughWallsEnabled = false

local WalkThroughWallsButton = MainTab:CreateToggle({
    Name = "Walk Through Walls",
    Callback = function()
        WalkThroughWallsEnabled = not WalkThroughWallsEnabled -- Toggle the state

        local player = game:GetService("Players").LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local hrp = character:FindFirstChild("HumanoidRootPart") -- Get the HumanoidRootPart

        if hrp then
            hrp.CanCollide = not WalkThroughWallsEnabled -- Toggle collision
        end

        -- Notify user
        Rayfield:Notify({
            Title = "Walk Through Walls",
            Content = "Walk Through Walls is now " .. (WalkThroughWallsEnabled and "Enabled" or "Disabled"),
            Duration = 3
        })
    end
})

--------------------------- new code Lower Graphics --------------------

-- -- FPS Boost Toggle Variable
-- local RunService = game:GetService("RunService") -- Ensure RunService is defined
-- local RenderingDisabled = false

-- -- Function to toggle rendering
-- local function ToggleRendering(state)
--     RenderingDisabled = state
--     if RenderingDisabled then
--         RunService:Set3dRenderingEnabled(false) -- Disable rendering
--         Rayfield:Notify({
--             Title = "FPS Booster",
--             Content = "Rendering Disabled! Maximum FPS Boost Applied.",
--             Duration = 3
--         })
--     else
--         RunService:Set3dRenderingEnabled(true) -- Enable rendering
--         Rayfield:Notify({
--             Title = "FPS Booster",
--             Content = "Rendering Restored! Graphics Back to Normal.",
--             Duration = 3
--         })
--     end
-- end

-- -- Create Toggle Button in UI
-- MainTab:CreateToggle({
--     Name = "Enable FPS Boost (Disable Rendering)",
--     Default = false, -- Starts in off mode
--     Callback = function(state)
--         ToggleRendering(state)
--     end
-- })







-------------------------------------------
--------------------
---
---










local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")
local Workspace = game:GetService("Workspace")
local RenderingDisabled = false

-- Function to toggle FPS Boost
local function ToggleRendering(state)
    RenderingDisabled = state

    if RenderingDisabled then
        -- Disable 3D Rendering
        RunService:Set3dRenderingEnabled(false)

        -- Disable Shadows
        Lighting.GlobalShadows = false

        -- Disable all ParticleEmitters
        for _, v in ipairs(Workspace:GetDescendants()) do
            if v:IsA("ParticleEmitter") or v:IsA("Beam") or v:IsA("Trail") then
                v.Enabled = false
            end
        end

        Rayfield:Notify({
            Title = "FPS Booster",
            Content = "Rendering & Extra Graphics Disabled! Maximum FPS Boost Applied.",
            Duration = 3
        })
    else
        -- Restore Settings
        RunService:Set3dRenderingEnabled(true)
        Lighting.GlobalShadows = true

        -- Enable all ParticleEmitters
        for _, v in ipairs(Workspace:GetDescendants()) do
            if v:IsA("ParticleEmitter") or v:IsA("Beam") or v:IsA("Trail") then
                v.Enabled = true
            end
        end

        Rayfield:Notify({
            Title = "FPS Booster",
            Content = "Rendering Restored! Graphics Back to Normal.",
            Duration = 3
        })
    end
end

-- Create Toggle Button in UI
MainTab:CreateToggle({
    Name = "Enable FPS Boost (Disable Rendering)",
    Default = false, -- Starts in off mode
    Callback = function(state)
        ToggleRendering(state)
    end
})

Rayfield:LoadConfiguration()



-----------------------------------------

-- teleport to spawn and Move Forward

local function teleportToSpawn()
    local player = game:GetService("Players").LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")

    if humanoidRootPart then
        local spawnLocation = game.Workspace:FindFirstChildOfClass("SpawnLocation")

        if spawnLocation then
            humanoidRootPart.CFrame = spawnLocation.CFrame + Vector3.new(0, 3, 0) -- Slightly above the spawn point
        else
            Rayfield:Notify({
                Title = "Spawn Error",
                Content = "No SpawnLocation found in the game!",
                Duration = 3
            })
        end
    end
end

local function autoMoveForward()
    local player = game:GetService("Players").LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")

    if humanoidRootPart then
        local stepCount = 0
        local maxSteps = 100 -- Move exactly 350 steps forward on Z-axis

        local connection
        connection = game:GetService("RunService").RenderStepped:Connect(function()
            if stepCount < maxSteps then
                humanoidRootPart.CFrame = humanoidRootPart.CFrame * CFrame.new(0, 0, -1) -- Moves forward along Z-axis
                stepCount = stepCount + 1
            else
                connection:Disconnect() -- Stop moving after 350 steps
            end
        end)

        -- Notify user
        Rayfield:Notify({
            Title = "Move Forward",
            Content = "Moved 350 steps forward on Z-axis!",
            Duration = 2
        })
    else
        Rayfield:Notify({
            Title = "Error",
            Content = "Character's HumanoidRootPart not found!",
            Duration = 2
        })
    end
end

local RespawnButton = MainTab:CreateToggle({
    Name = "Instant Spawn at Spawn Point",
    Callback = function()
        teleportToSpawn()
        autoMoveForward() -- Call the move forward function after teleporting

        -- Notify user
        Rayfield:Notify({
            Title = "Teleported!",
            Content = "You have been instantly moved to the spawn point.",
            Duration = 3
        })
    end
})

-- Fly
-- Version: 3.2

local scriptEnabled = false -- Default: script is disabled
local flyGUI = nil          -- Store GUI instance

local ToggleScriptButton = MainTab:CreateToggle({
    Name = "Enable Fly GUI",
    Callback = function()
        scriptEnabled = not scriptEnabled

        if scriptEnabled then
            RunScript() -- Call function to start script
            Rayfield:Notify({
                Title = "Script Status",
                Content = "Script Enabled",
                Duration = 3
            })
        end
    end
})

-- Function to start your script logic
function RunScript()
    if main then
        main.Enabled = true -- Show GUI if already created
        return
    end

    local main = Instance.new("ScreenGui")
    local Frame = Instance.new("Frame")
    local up = Instance.new("TextButton")
    local down = Instance.new("TextButton")
    local onof = Instance.new("TextButton")
    local TextLabel = Instance.new("TextLabel")
    local plus = Instance.new("TextButton")
    local speed = Instance.new("TextLabel")
    local mine = Instance.new("TextButton")

    -- Properties:

    main.Name = "main"
    main.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    main.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    Frame.Parent = main
    Frame.BackgroundColor3 = Color3.fromRGB(163, 255, 137)
    Frame.BorderColor3 = Color3.fromRGB(103, 221, 213)
    Frame.Position = UDim2.new(0.100320168, 0, 0.379746825, 0)
    Frame.Size = UDim2.new(0, 190, 0, 57)

    up.Name = "up"
    up.Parent = Frame
    up.BackgroundColor3 = Color3.fromRGB(79, 255, 152)
    up.Size = UDim2.new(0, 44, 0, 28)
    up.Font = Enum.Font.SourceSans
    up.Text = "UP"
    up.TextColor3 = Color3.fromRGB(0, 0, 0)
    up.TextSize = 14.000

    down.Name = "down"
    down.Parent = Frame
    down.BackgroundColor3 = Color3.fromRGB(215, 255, 121)
    down.Position = UDim2.new(0, 0, 0.491228074, 0)
    down.Size = UDim2.new(0, 44, 0, 28)
    down.Font = Enum.Font.SourceSans
    down.Text = "DOWN"
    down.TextColor3 = Color3.fromRGB(0, 0, 0)
    down.TextSize = 14.000

    onof.Name = "onof"
    onof.Parent = Frame
    onof.BackgroundColor3 = Color3.fromRGB(255, 249, 74)
    onof.Position = UDim2.new(0.702823281, 0, 0.491228074, 0)
    onof.Size = UDim2.new(0, 56, 0, 28)
    onof.Font = Enum.Font.SourceSans
    onof.Text = "fly"
    onof.TextColor3 = Color3.fromRGB(0, 0, 0)
    onof.TextSize = 14.000

    TextLabel.Parent = Frame
    TextLabel.BackgroundColor3 = Color3.fromRGB(242, 60, 255)
    TextLabel.Position = UDim2.new(0.469327301, 0, 0, 0)
    TextLabel.Size = UDim2.new(0, 100, 0, 28)
    TextLabel.Font = Enum.Font.SourceSans
    TextLabel.Text = "Click here to drag"
    TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
    TextLabel.TextScaled = true
    TextLabel.TextSize = 14.000
    TextLabel.TextWrapped = true

    plus.Name = "plus"
    plus.Parent = Frame
    plus.BackgroundColor3 = Color3.fromRGB(133, 145, 255)
    plus.Position = UDim2.new(0.231578946, 0, 0, 0)
    plus.Size = UDim2.new(0, 45, 0, 28)
    plus.Font = Enum.Font.SourceSans
    plus.Text = "+"
    plus.TextColor3 = Color3.fromRGB(0, 0, 0)
    plus.TextScaled = true
    plus.TextSize = 14.000
    plus.TextWrapped = true

    speed.Name = "speed"
    speed.Parent = Frame
    speed.BackgroundColor3 = Color3.fromRGB(255, 85, 0)
    speed.Position = UDim2.new(0.468421042, 0, 0.491228074, 0)
    speed.Size = UDim2.new(0, 44, 0, 28)
    speed.Font = Enum.Font.SourceSans
    speed.Text = "1"
    speed.TextColor3 = Color3.fromRGB(0, 0, 0)
    speed.TextScaled = true
    speed.TextSize = 14.000
    speed.TextWrapped = true

    mine.Name = "mine"
    mine.Parent = Frame
    mine.BackgroundColor3 = Color3.fromRGB(123, 255, 247)
    mine.Position = UDim2.new(0.231578946, 0, 0.491228074, 0)
    mine.Size = UDim2.new(0, 45, 0, 29)
    mine.Font = Enum.Font.SourceSans
    mine.Text = "-"
    mine.TextColor3 = Color3.fromRGB(0, 0, 0)
    mine.TextScaled = true
    mine.TextSize = 14.000
    mine.TextWrapped = true

    speeds = 1

    local speaker = game:GetService("Players").LocalPlayer

    local chr = game.Players.LocalPlayer.Character
    local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")

    nowe = false

    game:GetService("StarterGui")

    Frame.Active = true -- main = gui
    Frame.Draggable = true

    onof.MouseButton1Down:connect(function()
        if nowe == true then
            nowe = false

            speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing, true)
            speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, true)
            speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Flying, true)
            speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall, true)
            speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp, true)
            speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping, true)
            speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Landed, true)
            speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics, true)
            speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding, true)
            speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, true)
            speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Running, true)
            speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics, true)
            speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
            speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.StrafingNoPhysics, true)
            speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming, true)
            speaker.Character.Humanoid:ChangeState(Enum.HumanoidStateType.RunningNoPhysics)
        else
            nowe = true

            for i = 1, speeds do
                spawn(function()
                    local hb = game:GetService("RunService").Heartbeat

                    tpwalking = true
                    local chr = game.Players.LocalPlayer.Character
                    local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
                    while tpwalking and hb:Wait() and chr and hum and hum.Parent do
                        if hum.MoveDirection.Magnitude > 0 then
                            chr:TranslateBy(hum.MoveDirection)
                        end
                    end
                end)
            end
            game.Players.LocalPlayer.Character.Animate.Disabled = true
            local Char = game.Players.LocalPlayer.Character
            local Hum = Char:FindFirstChildOfClass("Humanoid") or Char:FindFirstChildOfClass("AnimationController")

            for i, v in next, Hum:GetPlayingAnimationTracks() do
                v:AdjustSpeed(0)
            end
            speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing, false)
            speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
            speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Flying, false)
            speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall, false)
            speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp, false)
            speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping, false)
            speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Landed, false)
            speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics, false)
            speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding, false)
            speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
            speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Running, false)
            speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics, false)
            speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
            speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.StrafingNoPhysics, false)
            speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming, false)
            speaker.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Swimming)
        end

        if game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid").RigType ==
            Enum.HumanoidRigType.R6 then
            local plr = game.Players.LocalPlayer
            local torso = plr.Character.Torso
            local flying = true
            local deb = true
            local ctrl = {
                f = 0,
                b = 0,
                l = 0,
                r = 0
            }
            local lastctrl = {
                f = 0,
                b = 0,
                l = 0,
                r = 0
            }
            local maxspeed = 50
            local speed = 0

            local bg = Instance.new("BodyGyro", torso)
            bg.P = 9e4
            bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
            bg.cframe = torso.CFrame
            local bv = Instance.new("BodyVelocity", torso)
            bv.velocity = Vector3.new(0, 0.1, 0)
            bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
            if nowe == true then
                plr.Character.Humanoid.PlatformStand = true
            end
            while nowe == true or game:GetService("Players").LocalPlayer.Character.Humanoid.Health == 0 do
                game:GetService("RunService").RenderStepped:Wait()

                if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
                    speed = speed + .5 + (speed / maxspeed)
                    if speed > maxspeed then
                        speed = maxspeed
                    end
                elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then
                    speed = speed - 1
                    if speed < 0 then
                        speed = 0
                    end
                end
                if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
                    bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f + ctrl.b)) +
                        ((game.Workspace.CurrentCamera.CoordinateFrame *
                                CFrame.new(ctrl.l + ctrl.r, (ctrl.f + ctrl.b) * .2, 0).p) -
                            game.Workspace.CurrentCamera.CoordinateFrame.p)) * speed
                    lastctrl = {
                        f = ctrl.f,
                        b = ctrl.b,
                        l = ctrl.l,
                        r = ctrl.r
                    }
                elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then
                    bv.velocity =
                        ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f + lastctrl.b)) +
                            ((game.Workspace.CurrentCamera.CoordinateFrame *
                                    CFrame.new(lastctrl.l + lastctrl.r, (lastctrl.f + lastctrl.b) * .2, 0).p) -
                                game.Workspace.CurrentCamera.CoordinateFrame.p)) * speed
                else
                    bv.velocity = Vector3.new(0, 0, 0)
                end
                --  game.Players.LocalPlayer.Character.Animate.Disabled = true
                bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame *
                    CFrame.Angles(-math.rad((ctrl.f + ctrl.b) * 50 * speed / maxspeed), 0, 0)
            end
            ctrl = {
                f = 0,
                b = 0,
                l = 0,
                r = 0
            }
            lastctrl = {
                f = 0,
                b = 0,
                l = 0,
                r = 0
            }
            speed = 0
            bg:Destroy()
            bv:Destroy()
            plr.Character.Humanoid.PlatformStand = false
            game.Players.LocalPlayer.Character.Animate.Disabled = false
            tpwalking = false
        else
            local plr = game.Players.LocalPlayer
            local UpperTorso = plr.Character.UpperTorso
            local flying = true
            local deb = true
            local ctrl = {
                f = 0,
                b = 0,
                l = 0,
                r = 0
            }
            local lastctrl = {
                f = 0,
                b = 0,
                l = 0,
                r = 0
            }
            local maxspeed = 50
            local speed = 0

            local bg = Instance.new("BodyGyro", UpperTorso)
            bg.P = 9e4
            bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
            bg.cframe = UpperTorso.CFrame
            local bv = Instance.new("BodyVelocity", UpperTorso)
            bv.velocity = Vector3.new(0, 0.1, 0)
            bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
            if nowe == true then
                plr.Character.Humanoid.PlatformStand = true
            end
            while nowe == true or game:GetService("Players").LocalPlayer.Character.Humanoid.Health == 0 do
                wait()

                if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
                    speed = speed + .5 + (speed / maxspeed)
                    if speed > maxspeed then
                        speed = maxspeed
                    end
                elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then
                    speed = speed - 1
                    if speed < 0 then
                        speed = 0
                    end
                end
                if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
                    bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f + ctrl.b)) +
                        ((game.Workspace.CurrentCamera.CoordinateFrame *
                                CFrame.new(ctrl.l + ctrl.r, (ctrl.f + ctrl.b) * .2, 0).p) -
                            game.Workspace.CurrentCamera.CoordinateFrame.p)) * speed
                    lastctrl = {
                        f = ctrl.f,
                        b = ctrl.b,
                        l = ctrl.l,
                        r = ctrl.r
                    }
                elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then
                    bv.velocity =
                        ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f + lastctrl.b)) +
                            ((game.Workspace.CurrentCamera.CoordinateFrame *
                                    CFrame.new(lastctrl.l + lastctrl.r, (lastctrl.f + lastctrl.b) * .2, 0).p) -
                                game.Workspace.CurrentCamera.CoordinateFrame.p)) * speed
                else
                    bv.velocity = Vector3.new(0, 0, 0)
                end

                bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame *
                    CFrame.Angles(-math.rad((ctrl.f + ctrl.b) * 50 * speed / maxspeed), 0, 0)
            end
            ctrl = {
                f = 0,
                b = 0,
                l = 0,
                r = 0
            }
            lastctrl = {
                f = 0,
                b = 0,
                l = 0,
                r = 0
            }
            speed = 0
            bg:Destroy()
            bv:Destroy()
            plr.Character.Humanoid.PlatformStand = false
            game.Players.LocalPlayer.Character.Animate.Disabled = false
            tpwalking = false
        end
    end)

    up.MouseButton1Down:connect(function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 2, 0)
    end)

    down.MouseButton1Down:connect(function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, -2, 0)
    end)

    game:GetService("Players").LocalPlayer.CharacterAdded:Connect(function(char)
        wait(0.7)
        game.Players.LocalPlayer.Character.Humanoid.PlatformStand = false
        game.Players.LocalPlayer.Character.Animate.Disabled = false
    end)

    plus.MouseButton1Down:connect(function()
        speeds = speeds + 1
        speed.Text = speeds
        if nowe == true then
            tpwalking = false
            for i = 1, speeds do
                spawn(function()
                    local hb = game:GetService("RunService").Heartbeat

                    tpwalking = true
                    local chr = game.Players.LocalPlayer.Character
                    local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
                    while tpwalking and hb:Wait() and chr and hum and hum.Parent do
                        if hum.MoveDirection.Magnitude > 0 then
                            chr:TranslateBy(hum.MoveDirection)
                        end
                    end
                end)
            end
        end
    end)
    mine.MouseButton1Down:connect(function()
        if speeds == 1 then
            speed.Text = 'can not be less than 1'
            wait(1)
            speed.Text = speeds
        else
            speeds = speeds - 1
            speed.Text = speeds
            if nowe == true then
                tpwalking = false
                for i = 1, speeds do
                    spawn(function()
                        local hb = game:GetService("RunService").Heartbeat

                        tpwalking = true
                        local chr = game.Players.LocalPlayer.Character
                        local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
                        while tpwalking and hb:Wait() and chr and hum and hum.Parent do
                            if hum.MoveDirection.Magnitude > 0 then
                                chr:TranslateBy(hum.MoveDirection)
                            end
                        end
                    end)
                end
            end
        end
    end)
end

-- auto follow script

local following = false

-- ✅ Function to find the ball
local function getBall()
    return game.Workspace:FindFirstChild("Part")
end

-- ✅ Function to follow the ball smoothly
local function followBall()
    local player = game:GetService("Players").LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
    local humanoid = character:FindFirstChildOfClass("Humanoid")

    local lastPosition = humanoidRootPart.Position -- Store previous position for smooth transition

    while following do
        local ball = getBall()
        if ball and humanoid and humanoidRootPart then
            local ballPosition = ball.Position

            -- Smooth left/right movement using Lerp
            local newPosition = lastPosition:Lerp(Vector3.new(ballPosition.X, humanoidRootPart.Position.Y,
                ballPosition.Z), 0.1)

            humanoid:MoveTo(newPosition)
            lastPosition = newPosition -- Update last position for smooth transition
        end
        wait(0.05)                     -- Faster update for smoother movement
    end
end

-- ✅ Creating the toggle button inside the GUI
MainTab:CreateToggle({
    Name = "Follow Ball",
    CurrentValue = false,
    Flag = "BallFollow",
    Callback = function(value)
        following = value
        if following then
            followBall()
        end
    end
})

-- CONTINOUS HIT BUTTON ONLY FOR PC

local vim = game:GetService("VirtualInputManager")
local hitKey = Enum.KeyCode.F
local autoHitEnabled = false
local autoHitThreads = {}

-- Function to start/stop auto-hit spam
local function toggleAutoHit(enabled)
    if enabled then
        for i = 1, 20 do
            local thread = task.spawn(function()
                while autoHitEnabled do
                    vim:SendKeyEvent(true, hitKey, false, game)
                    vim:SendKeyEvent(false, hitKey, false, game)
                    task.wait()
                end
            end)
            table.insert(autoHitThreads, thread)
        end
    else
        autoHitEnabled = false
        autoHitThreads = {} -- Clear threads
    end
end

-- Toggle Button for Auto Hit
MainTab:CreateToggle({
    Name = "🔥 Ultra-Fast Auto-Hit",
    CurrentValue = false,
    Flag = "AutoHit",
    Callback = function(value)
        autoHitEnabled = value
        toggleAutoHit(value)
        Rayfield:Notify({
            Title = "Auto-Hit",
            Content = value and "✅ Auto-Hit Enabled!" or "❌ Auto-Hit Disabled!",
            Duration = 2
        })
    end
})




-- AUTO HIT BALL

local vim = game:GetService("VirtualInputManager")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local hitKey = Enum.KeyCode.F

local autoHitEnabled = false
local hitCooldown = 0.2 -- seconds between hits
local lastHitTime = 0

local function getBall()
    return workspace:FindFirstChild("Part") -- Ball is named "Part"
end

-- Smart Auto-Hit Logic
local function startSmartAutoHit()
    local character = player.Character or player.CharacterAdded:Wait()
    local root = character:WaitForChild("HumanoidRootPart")

    local prevBallPosition = nil

    RunService.RenderStepped:Connect(function()
        if not autoHitEnabled then return end

        local ball = getBall()
        if not (ball and root) then return end

        -- Get ball movement direction
        if not prevBallPosition then
            prevBallPosition = ball.Position
            return
        end

        local ballVelocity = (ball.Position - prevBallPosition) / RunService.RenderStepped:Wait()
        prevBallPosition = ball.Position

        local directionToPlayer = (root.Position - ball.Position).Unit
        local ballSpeed = ballVelocity.Magnitude
        local ballDirection = ballVelocity.Unit

        -- Check if ball is moving TOWARD player
        local dot = ballDirection:Dot(directionToPlayer)
        local isComingToward = dot > 0.7 -- > 0.7 means mostly toward you

        local distance = (ball.Position - root.Position).Magnitude

        if isComingToward and distance < 9 and tick() - lastHitTime > hitCooldown then
            vim:SendKeyEvent(true, hitKey, false, game)
            vim:SendKeyEvent(false, hitKey, false, game)
            lastHitTime = tick()
            print("🎯 Smart Auto-Hit: Ball is coming toward you! Distance:", math.floor(distance))
        end
    end)
end

MainTab:CreateToggle({
    Name = "🎯 Smart Auto-Hit (Hit only when you’re the target)",
    CurrentValue = false,
    Callback = function(state)
        autoHitEnabled = state
        if state then
            startSmartAutoHit()
            Rayfield:Notify({
                Title = "Smart Auto-Hit",
                Content = "Enabled - It will now only hit when you're the target.",
                Duration = 3
            })
        else
            Rayfield:Notify({
                Title = "Smart Auto-Hit",
                Content = "Disabled.",
                Duration = 2
            })
        end
    end
})

