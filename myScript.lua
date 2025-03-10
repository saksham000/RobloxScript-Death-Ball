local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
-- wKfeCSIgOVYuvGzntOfyjriSJftgMqhX
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
       Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
       Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
       RememberJoins = true -- Set this to false to make them join the discord every time they load it up
    },
 
    KeySystem = false, -- Set this to true to use our key system
    KeySettings = {
       Title = "Untitled",
       Subtitle = "Key System",
       Note = "No method of obtaining the key is provided", -- Use this to tell the user how to get a key
       FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
       SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
       GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
       Key = {"Hello"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
    }
 })

 local MainTab = Window:CreateTab("🎇 Home", nil) -- Title, Image
 local MainSection = MainTab:CreateSection("Main")

 Rayfield:Notify({
    Title = "Script is Executed",
    Content = "Loading gui",
    Duration = 5,
    Image = nil,
 })




 local InfiniteJumpEnabled = false
local JumpConnection -- Store the connection so we can properly disconnect it

local Button = MainTab:CreateButton({
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
            Duration = 3,
        })
    end
})


local WalkThroughWallsEnabled = false

local WalkThroughWallsButton = MainTab:CreateButton({
    Name = "Walk Through Walls",
    Callback = function()
        WalkThroughWallsEnabled = not WalkThroughWallsEnabled  -- Toggle the state
        
        local player = game:GetService("Players").LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local hrp = character:FindFirstChild("HumanoidRootPart") -- Get the HumanoidRootPart

        if hrp then
            hrp.CanCollide = not WalkThroughWallsEnabled  -- Toggle collision
        end

        -- Notify user
        Rayfield:Notify({
            Title = "Walk Through Walls",
            Content = "Walk Through Walls is now " .. (WalkThroughWallsEnabled and "Enabled" or "Disabled"),
            Duration = 3,
        })
    end
})

-- lower fps

local LowFPSModeEnabled = false

local LowFPSButton = MainTab:CreateButton({
    Name = "Low FPS Mode",
    Callback = function()
        LowFPSModeEnabled = not LowFPSModeEnabled  -- Toggle state

        -- Get Graphics Settings
        local lighting = game:GetService("Lighting")
        local terrain = workspace:FindFirstChildOfClass("Terrain")

        if LowFPSModeEnabled then
            -- Reduce Lighting Effects
            lighting.GlobalShadows = false
            lighting.Brightness = 0
            lighting.FogEnd = 0

            -- Lower Terrain Quality
            if terrain then
                terrain.WaterWaveSize = 0
                terrain.WaterWaveSpeed = 0
                terrain.WaterReflectance = 0
                terrain.WaterTransparency = 1
            end

            -- Lower other graphic-intensive settings
            for _, v in ipairs(workspace:GetDescendants()) do
                if v:IsA("ParticleEmitter") or v:IsA("Beam") or v:IsA("Trail") then
                    v.Enabled = false -- Disable extra visual effects
                end
            end

        else
            -- Restore Default Graphics
            lighting.GlobalShadows = true
            lighting.Brightness = 2
            lighting.FogEnd = 100000

            if terrain then
                terrain.WaterWaveSize = 1
                terrain.WaterWaveSpeed = 1
                terrain.WaterReflectance = 1
                terrain.WaterTransparency = 0.5
            end

            -- Re-enable effects
            for _, v in ipairs(workspace:GetDescendants()) do
                if v:IsA("ParticleEmitter") or v:IsA("Beam") or v:IsA("Trail") then
                    v.Enabled = true -- Restore effects
                end
            end
        end

        -- Notify User
        Rayfield:Notify({
            Title = "Low FPS Mode",
            Content = "Low FPS Mode is now " .. (LowFPSModeEnabled and "Enabled" or "Disabled"),
            Duration = 3,
        })
    end
})





-- AUTO Move Forward

local AutoWalkButton = MainTab:CreateButton({
    Name = "Move Forward (550 Steps)",
    Callback = function()
        local player = game:GetService("Players").LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local humanoid = character:FindFirstChildOfClass("Humanoid")

        if humanoid then
            local stepCount = 0
            local maxSteps = 550  -- Fixed value of 550 steps
            
            local connection
            connection = game:GetService("RunService").RenderStepped:Connect(function()
                if stepCount < maxSteps then
                    humanoid:Move(Vector3.new(0, 0, -1), true) -- Move forward one step
                    stepCount = stepCount + 1
                else
                    connection:Disconnect() -- Stop moving after 550 steps
                end
            end)

            -- Notify user
            Rayfield:Notify({
                Title = "Move Forward",
                Content = "Moved 550 steps forward!",
                Duration = 3,
            })
        else
            Rayfield:Notify({
                Title = "Error",
                Content = "Character not found!",
                Duration = 3,
            })
        end
    end
})
