local Rayfield = nil

-- Load Rayfield safely
pcall(function()
    Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
end)

if not Rayfield then
    warn("Failed to load Rayfield. Check if the URL is working.")
    return
end

-- Create UI
local Window = Rayfield:CreateWindow({
    Name = "Ball Teleport",
    LoadingTitle = "Teleport Script",
    LoadingSubtitle = "By YourName",
    ConfigurationSaving = { Enabled = false },
    KeySystem = false
})

local MainTab = Window:CreateTab("Main", 4483362458)
local MainSection = MainTab:CreateSection("Teleport")

-- Toggle state
local teleporting = false

-- Function to find the ball
local function getBall()
    local ball = game.Workspace:FindFirstChild("Part") -- Adjust if the ball has a different name
    if ball and ball:IsA("BasePart") then
        return ball
    end
    return nil
end

-- Function to teleport player to ball
local function teleportToBall()
    local player = game:GetService("Players").LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")

    if humanoidRootPart then
        local ball = getBall()

        if ball then
            humanoidRootPart.CFrame = ball.CFrame + Vector3.new(0, 3, 0) -- Teleport slightly above the ball
        else
            Rayfield:Notify({
                Title = "Teleport Error",
                Content = "Ball not found!",
                Duration = 3
            })
        end
    end
end

-- Teleport loop
local function startTeleportLoop()
    while teleporting do
        teleportToBall()
        wait(1) -- Teleport every second
    end
end

-- Create toggle button
MainTab:CreateToggle({
    Name = "Toggle Ball Teleport",
    CurrentValue = false,
    Callback = function(state)
        teleporting = state
        if teleporting then
            startTeleportLoop()
        end
    end
})




 AUTO FOLLOW BALL SCRIPT WORKING !!!!!!!!!!!!!



local player = game:GetService("Players").LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
local humanoid = character:FindFirstChildOfClass("Humanoid")

local lastPosition = humanoidRootPart.Position -- Store previous position for smooth transition

-- Function to find the ball
local function getBall()
    return game.Workspace:FindFirstChild("Part") -- Change "Part" to actual ball name
end

while true do
    local ball = getBall()
    if ball and humanoid and humanoidRootPart then
        local ballPosition = ball.Position

        -- Smoothly transition left/right instead of snapping instantly
        local newPosition = lastPosition:Lerp(Vector3.new(ballPosition.X, humanoidRootPart.Position.Y, ballPosition.Z), 0.1)

        humanoid:MoveTo(newPosition)

        lastPosition = newPosition -- Update last position for smooth transition
    end
    wait(0.05) -- Faster update for smoother movement
end


---------------------------------------------------------------------------------------



AUTO HIT SCRIPT SOME WHAT WORKING ONLY LIITLE BIT



local player = game:GetService("Players").LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
local vim = game:GetService("VirtualInputManager") -- Use Virtual Input Manager for key presses

local hitCooldown = 1.5 -- Adjust based on game delay
local lastHitTime = 0
local hitKey = Enum.KeyCode.F -- Change to Enum.UserInputType.MouseButton1 for left-click

-- Function to find the ball
local function getBall()
    return game.Workspace:FindFirstChild("Part") -- Change "Part" to the ball’s actual name
end

-- Function to check distance and hit the ball
local function autoHitBall()
    while true do
        local ball = getBall()
        if ball and humanoidRootPart then
            local distance = (ball.Position - humanoidRootPart.Position).magnitude

            -- If the ball is within 10 studs and cooldown has passed, hit the ball
            if distance <= 10 and (tick() - lastHitTime) > hitCooldown then
                lastHitTime = tick() -- Update last hit time
                
                -- Simulate pressing "F" to hit the ball
                vim:SendKeyEvent(true, hitKey, false, game)
                task.wait(0.1) -- Short delay for key press
                vim:SendKeyEvent(false, hitKey, false, game)

                print("Auto-hit triggered!")
            end
        end
        wait(0.1) -- Check every 0.1s for best performance
    end
end

-- Start the auto-hit function
task.spawn(autoHitBall)


############ continous HIT


local vim = game:GetService("VirtualInputManager")
local hitKey = Enum.KeyCode.F -- Change this if your hit key is different

for i = 1, 10 do -- Creates multiple threads for ultra-fast spam
    task.spawn(function()
        while true do
            vim:SendKeyEvent(true, hitKey, false, game) -- Press key
            vim:SendKeyEvent(false, hitKey, false, game) -- Release key
            task.wait() -- Keeps script running without crashing
        end
    end)
end




------------------------------------------PRINTS DATA ON HIT OF BALL BY PLAYER --------------------------------


local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Find the correct RemoteEvent
local HitEvent = ReplicatedStorage:FindFirstChild("Actions") and ReplicatedStorage.Actions:FindFirstChild("Action")

if not HitEvent then
    print("⚠️ Could not find the correct RemoteEvent!")
    return
end

-- Function to check if the event belongs to the local player
local function isPlayerEvent(arguments)
    for _, arg in pairs(arguments) do
        if tostring(arg) == LocalPlayer.Name then
            return true
        end
    end
    return false
end

-- Function to listen for hit attempts
local function listenForHitEvents()
    print("🔍 Listening for YOUR Hit Event... Press 'F' in-game to hit the ball!")

    HitEvent.OnClientEvent:Connect(function(...)
        local args = {...}
        if isPlayerEvent(args) then
            print("🎯 Hit Event Triggered! Arguments:", unpack(args))
        end
    end)
end

-- Start listening
listenForHitEvents()



-------------------------------------------------------------------------------------------------------------
