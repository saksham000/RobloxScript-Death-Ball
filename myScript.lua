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





-- AUTO DOGE


local AutoParryEnabled = false
local ParryConnection = nil

local function GetIncomingBall()
    local player = game:GetService("Players").LocalPlayer
    local character = player.Character
    local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")

    if not humanoidRootPart then return nil end

    local closestBall = nil
    local closestDistance = math.huge

    for _, object in pairs(workspace:GetChildren()) do
        if object:IsA("BasePart") and object.Name:lower():find("ball") then  
            local distance = (object.Position - humanoidRootPart.Position).Magnitude
            local velocity = object.AssemblyLinearVelocity
            local directionToPlayer = (humanoidRootPart.Position - object.Position).Unit

            -- Only detect fast-moving balls coming towards the player
            if velocity.Magnitude > 5 and directionToPlayer:Dot(velocity.Unit) > 0.8 then  
                if distance < closestDistance then
                    closestDistance = distance
                    closestBall = object
                end
            end
        end
    end

    return closestBall, closestDistance
end

local function AutoParry()
    local player = game:GetService("Players").LocalPlayer
    local character = player.Character
    local sword = character and character:FindFirstChildWhichIsA("Tool") 

    if not sword then return end

    local ball, distance = GetIncomingBall()

    if ball and distance < 6 then  -- Adjust for better timing
        sword:Activate()  -- Auto parry the ball
    end
end

local ParryButton = MainTab:CreateButton({
    Name = "Auto Parry Ball",
    Callback = function()
        AutoParryEnabled = not AutoParryEnabled  

        if AutoParryEnabled then
            ParryConnection = game:GetService("RunService").Stepped:Connect(function()
                AutoParry()
            end)
        else
            if ParryConnection then
                ParryConnection:Disconnect()
                ParryConnection = nil
            end
        end

        -- Notify user
        Rayfield:Notify({
            Title = "Auto Parry Ball",
            Content = "Auto Parry is now " .. (AutoParryEnabled and "Enabled" or "Disabled"),
            Duration = 3,
        })
    end
})
