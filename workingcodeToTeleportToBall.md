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




