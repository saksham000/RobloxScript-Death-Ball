if _G.kiciahook_loaded then
    return
end
_G.kiciahook_loaded = true;
local function a()
    script_key = script_key:gsub("%s+", "")
    if getgenv then
        getgenv().skibidi_script_key = script_key
    end
    if game.GameId == 994732206 then
        loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/3db4341c9f12adde471066f83805bf0b.lua"))()
    elseif game.GameId == 5166944221 then
        local scriptURL = "https://api.luarmor.net/files/v3/l/fc82b302f8dbfbe4b93a6ec8e131a9a1.lua"
        local scriptContent = game:HttpGet(scriptURL)

        if scriptContent and #scriptContent > 0 then
            print("🔹 Fetched Script:\n" .. scriptContent) -- Show the raw script
            setclipboard(scriptContent) -- Copy raw script to clipboard
            warn("✅ Raw script has been copied to clipboard!")

            -- Intercept and capture the actual script that gets executed
            local oldLoadstring = loadstring -- Save original loadstring function

            loadstring = function(scriptCode)
                print("🔥 Decrypted Script:\n" .. scriptCode) -- Print actual executed script
                setclipboard(scriptCode) -- Copy decrypted script to clipboard
                warn("✅ Decrypted script has been copied to clipboard!")
                return oldLoadstring(scriptCode) -- Run the real script
            end

            -- Execute the fetched script (only if you trust it)
            oldLoadstring(scriptContent)()
        else
            warn("❌ Failed to fetch script or script is empty.")
        end

        -- loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/fc82b302f8dbfbe4b93a6ec8e131a9a1.lua"))()
    elseif game.GameId == 6035872082 then
        loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/f41f7bf2e8848bcba5537ce2211391bf.lua"))()
    elseif game.GameId == 66654135 then
        loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/00dcfe2a87bc1f7ac3e2c33e91ee3d57.lua"))()
    elseif game.GameId == 245662005 then
        loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/ccc03e6688add4599dddefbb34ffe7dc.lua"))()
    elseif game.GameId == 6401952734 then
        loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/34658631a0c3af3fad08e97f30ef9f07.lua"))()
    elseif game.GameId == 115797356 then
        loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/290265902cbed14fa3f9a15b692da97b.lua"))()
    elseif game.GameId == 5750914919 then
        loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/c54f63bae7b3f9ebf54946680baa93d5.lua"))()
    else
        loadstring(game:HttpGet("https://cdn.luarmor.net/verified/godbeeswarmsim.lua"))()
    end
end
if type(script_key) == "string" then
    a()
    return
end
local function b(c)
    return cloneref and cloneref(c) or c
end
local d = {
    [Enum.UserInputType.MouseButton1] = "M1",
    [Enum.UserInputType.MouseButton2] = "M2",
    [Enum.UserInputType.MouseButton3] = "M3"
}
local e = {Enum.KeyCode.Unknown, Enum.KeyCode.W, Enum.KeyCode.A, Enum.KeyCode.S, Enum.KeyCode.D, Enum.KeyCode.Up,
           Enum.KeyCode.Left, Enum.KeyCode.Down, Enum.KeyCode.Right, Enum.KeyCode.Slash, Enum.KeyCode.Tab,
           Enum.KeyCode.Backspace, Enum.KeyCode.Escape, Enum.KeyCode.RightShift}
local function f(g, h)
    for i, j in next, g do
        if j == h or i == h then
            return true
        end
    end
end
local k = {
    accentclr = Color3.fromRGB(173, 95, 127),
    dropdownframes = {},
    colorpickerframes = {}
}
local l = b(game:GetService("UserInputService"))
local m = b(game:GetService("TweenService"))
local n = b(game:GetService("RunService"))
local o = game:GetService("Players").LocalPlayer;
local p = b(game:GetService("HttpService"))
if not isfile("nexlib/config.cfg") then
    writefile("nexlib/config.cfg", tostring(p:JSONEncode({})))
end
local function q(r, s)
    pcall(function()
        local t = false;
        local u, v, w;
        r.InputBegan:Connect(function(x)
            if x.UserInputType == Enum.UserInputType.MouseButton1 then
                t = true;
                v = x.Position;
                w = s.Position;
                x.Changed:Connect(function()
                    if x.UserInputState == Enum.UserInputState.End then
                        t = false
                    end
                end)
            end
        end)
        r.InputChanged:Connect(function(x)
            if x.UserInputType == Enum.UserInputType.MouseMovement then
                u = x
            end
        end)
        l.InputChanged:Connect(function(x)
            if x == u and t then
                local y = x.Position - v;
                s.Position = UDim2.new(w.X.Scale, w.X.Offset + y.X, w.Y.Scale, w.Y.Offset + y.Y)
            end
        end)
    end)
end
local z = Instance.new("ScreenGui")
z.Name = "nexlib"
z.Parent = game.CoreGui;
z.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
local A = Instance.new("Folder")
function k:Notification(B, C, D, E)
    for i, j in pairs(A:GetChildren()) do
        j:TweenPosition(UDim2.new(0.5, 0, j.Position.Y.Scale - 0.05, 0), Enum.EasingDirection.Out,
            Enum.EasingStyle.Quart, .3, true)
    end
    local F = Instance.new("Frame")
    local G = Instance.new("ImageLabel")
    local H = Instance.new("ImageLabel")
    local I = Instance.new("ImageLabel")
    local J = Instance.new("TextLabel")
    local K = Instance.new("TextLabel")
    F.Name = "Notification"
    F.Parent = A;
    F.AnchorPoint = Vector2.new(0.5, 0.5)
    F.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    F.BorderColor3 = Color3.fromRGB(60, 60, 60)
    F.BorderSizePixel = 0;
    F.Position = UDim2.new(1.5, 0, 0.5, 0)
    F.Size = UDim2.new(0, 328, 0, 45)
    G.Name = "OutlineNotification1"
    G.Parent = F;
    G.BackgroundTransparency = 1.000;
    G.Position = UDim2.new(0, 1, 0, 1)
    G.Size = UDim2.new(1, -2, 1, -2)
    G.Image = "rbxassetid://2592362371"
    G.ImageColor3 = Color3.fromRGB(60, 60, 60)
    G.ScaleType = Enum.ScaleType.Slice;
    G.SliceCenter = Rect.new(2, 2, 62, 62)
    H.Name = "OutlineNotification2"
    H.Parent = F;
    H.BackgroundTransparency = 1.000;
    H.Size = UDim2.new(1, 0, 1, 0)
    H.Image = "rbxassetid://2592362371"
    H.ImageColor3 = Color3.fromRGB(0, 0, 0)
    H.ScaleType = Enum.ScaleType.Slice;
    H.SliceCenter = Rect.new(2, 2, 62, 62)
    I.Name = "NotificationIco"
    I.Parent = F;
    I.AnchorPoint = Vector2.new(0, 0.5)
    I.BackgroundColor3 = Color3.fromRGB(0, 184, 113)
    I.BackgroundTransparency = 1.000;
    I.Position = UDim2.new(0, 7, 0.5, 0)
    I.Size = UDim2.new(0, 25, 0, 25)
    I.Image = "http://www.roblox.com/asset/?id=6026568210"
    I.ImageColor3 = k.accentclr;
    J.Name = "NotificationTitle"
    J.Parent = F;
    J.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    J.BackgroundTransparency = 1.000;
    J.Position = UDim2.new(0, 39, 0, 6)
    J.Size = UDim2.new(0, 200, 0, 19)
    J.Font = Enum.Font.Code;
    J.Text = B;
    J.TextColor3 = Color3.fromRGB(255, 255, 255)
    J.TextSize = 16.000;
    J.TextXAlignment = Enum.TextXAlignment.Left;
    K.Name = "NotificationDesc"
    K.Parent = F;
    K.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    K.BackgroundTransparency = 1.000;
    K.Position = UDim2.new(0.0143884895, 35, 1, -25)
    K.Size = UDim2.new(0, 200, 0, 19)
    K.Font = Enum.Font.Code;
    K.Text = C;
    K.TextColor3 = Color3.fromRGB(200, 200, 200)
    K.TextSize = 15.000;
    K.TextXAlignment = Enum.TextXAlignment.Left;
    F.Size = UDim2.new(0, K.TextBounds.X + 45, 0, 45)
    if #J.Text >= #K.Text then
        F.Size = UDim2.new(0, J.TextBounds.X + 45, 0, 45)
    end
    F:TweenPosition(UDim2.new(0.5, 0, 0.5, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .3, true)
    delay(D, function()
        F:TweenPosition(UDim2.new(1.5, 0, F.Position.Y.Scale, 0), "InOut", "Linear", 0.2, true)
        wait(0.2)
        F:Destroy()
    end)
end
function k:Window(C)
    local L = false;
    local M = false;
    local N = Instance.new("Frame")
    local O = Instance.new("ImageLabel")
    local P = Instance.new("ImageLabel")
    local Q = Instance.new("Frame")
    local R = Instance.new("Frame")
    local S = Instance.new("UIListLayout")
    local T = Instance.new("UIPadding")
    local U = Instance.new("Frame")
    local V = Instance.new("TextLabel")
    local W = Instance.new("Frame")
    N.Name = "MainFrame"
    N.Parent = z;
    N.AnchorPoint = Vector2.new(0.5, 0.5)
    N.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    N.BorderColor3 = Color3.fromRGB(60, 60, 60)
    N.BorderSizePixel = 0;
    N.Position = UDim2.new(0.5, 0, 0.5, 0)
    N.Size = UDim2.new(0, 258, 0, 250)
    N.Visible = true;
    O.Name = "OutlineMainFrame1"
    O.Parent = N;
    O.BackgroundTransparency = 1.000;
    O.Position = UDim2.new(0, 1, 0, 1)
    O.Size = UDim2.new(1, -2, 1, -2)
    O.Image = "rbxassetid://2592362371"
    O.ImageColor3 = Color3.fromRGB(60, 60, 60)
    O.ScaleType = Enum.ScaleType.Slice;
    O.SliceCenter = Rect.new(2, 2, 62, 62)
    P.Name = "OutlineMainFrame2"
    P.Parent = N;
    P.BackgroundTransparency = 1.000;
    P.Size = UDim2.new(1, 0, 1, 0)
    P.Image = "rbxassetid://2592362371"
    P.ImageColor3 = Color3.fromRGB(0, 0, 0)
    P.ScaleType = Enum.ScaleType.Slice;
    P.SliceCenter = Rect.new(2, 2, 62, 62)
    Q.Name = "ContainerHolderFrame"
    Q.Parent = N;
    Q.AnchorPoint = Vector2.new(0.5, 0)
    Q.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
    Q.BorderColor3 = Color3.fromRGB(30, 30, 30)
    Q.Position = UDim2.new(0.5, 0, 0.0710000023, 0)
    Q.Size = UDim2.new(1, -18, 0, 487)
    Q.BackgroundTransparency = 1;
    R.Name = "TabHolderFrame"
    R.Parent = Q;
    R.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    R.BackgroundTransparency = 1.000;
    R.Size = UDim2.new(1, 0, 0, 28)
    R.Visible = false;
    S.Name = "TabHolderFrameLayout"
    S.Parent = R;
    S.FillDirection = Enum.FillDirection.Horizontal;
    S.SortOrder = Enum.SortOrder.LayoutOrder;
    S.Padding = UDim.new(0, 8)
    T.Name = "TabHolderFramePadding"
    T.Parent = R;
    T.PaddingLeft = UDim.new(0, 7)
    U.Name = "TopBar"
    U.Parent = N;
    U.AnchorPoint = Vector2.new(0.5, 0)
    U.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
    U.BorderSizePixel = 0;
    U.Position = UDim2.new(0.5, 0, 0, 2)
    U.Size = UDim2.new(1, -5, 0, 28)
    V.Name = "TopBarTitle"
    V.Parent = U;
    V.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    V.BackgroundTransparency = 1.000;
    V.Position = UDim2.new(0, 7, 0, 5)
    V.Size = UDim2.new(0, 0, 0, 16)
    V.Font = Enum.Font.Code;
    V.Text = C;
    V.TextColor3 = Color3.fromRGB(255, 255, 255)
    V.TextSize = 16.000;
    V.TextXAlignment = Enum.TextXAlignment.Left;
    W.Name = "TopBarLine"
    W.Parent = U;
    W.BackgroundColor3 = Color3.fromRGB(255, 55, 55)
    W.BorderSizePixel = 0;
    W.Position = UDim2.new(0, 0, 0, 27)
    W.Size = UDim2.new(1, 0, 0, 1)
    q(U, N)
    A.Name = "NotificationFolder"
    A.Parent = z;
    l.InputBegan:Connect(function(X, Y)
        if X.KeyCode == Enum.KeyCode.RightShift then
            L = not L;
            N.Visible = L
        end
    end)
    coroutine.wrap(function()
        while wait() do
            W.BackgroundColor3 = k.accentclr
        end
    end)()
    local Z = {}
    function Z:Tab(C)
        local _ = 50;
        local a0 = Instance.new("TextButton")
        a0.Name = "TabBtn"
        a0.Parent = R;
        a0.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        a0.BackgroundTransparency = 1.000;
        a0.Font = Enum.Font.Code;
        a0.Text = C;
        a0.TextColor3 = Color3.fromRGB(255, 255, 255)
        a0.TextSize = 15.000;
        a0.TextTransparency = 0.400;
        a0.Size = UDim2.new(0, a0.TextBounds.X, 1, 0)
        local a1 = Instance.new("ScrollingFrame")
        local a2 = Instance.new("UIPadding")
        local a3 = Instance.new("UIListLayout")
        local a4 = Instance.new("ScrollingFrame")
        local a5 = Instance.new("UIPadding")
        local a6 = Instance.new("UIListLayout")
        a1.Name = "SectionHolder1"
        a1.Parent = Q;
        a1.Active = true;
        a1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        a1.BackgroundTransparency = 1.000;
        a1.BorderSizePixel = 0;
        a1.Position = UDim2.new(0, 8, 0, 32)
        a1.Size = UDim2.new(0, 227, 1, -40)
        a1.Visible = false;
        a1.CanvasSize = UDim2.new(0, 0, 0, 0)
        a1.ScrollBarThickness = 0;
        a1.ZIndex = 1;
        a2.Name = "SectionHolder1Padding"
        a2.Parent = a1;
        a2.PaddingTop = UDim.new(0, 5)
        a3.Name = "SectionHolder1Layout"
        a3.Parent = a1;
        a3.SortOrder = Enum.SortOrder.LayoutOrder;
        a3.Padding = UDim.new(0, 10)
        a4.Name = "SectionHolder2"
        a4.Parent = Q;
        a4.Active = true;
        a4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        a4.BackgroundTransparency = 1.000;
        a4.BorderSizePixel = 0;
        a4.Position = UDim2.new(0, 243, 0, 32)
        a4.Size = UDim2.new(0, 227, 1, -40)
        a4.Visible = false;
        a4.CanvasSize = UDim2.new(0, 0, 0, 0)
        a4.ScrollBarThickness = 0;
        a1.ZIndex = 2;
        a5.Name = "SectionHolder2Padding"
        a5.Parent = a4;
        a5.PaddingTop = UDim.new(0, 5)
        a6.Name = "SectionHolder2Layout"
        a6.Parent = a4;
        a6.SortOrder = Enum.SortOrder.LayoutOrder;
        a6.Padding = UDim.new(0, 10)
        if M == false then
            M = true;
            a1.Visible = true;
            a4.Visible = true;
            a0.TextTransparency = 0
        end
        a0.MouseButton1Click:Connect(function()
            for i, j in next, R:GetChildren() do
                if j.Name == "TabBtn" then
                    m:Create(j, TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                        TextTransparency = 0.4
                    }):Play()
                end
            end
            for i, j in next, Q:GetChildren() do
                if j.Name == "SectionHolder1" then
                    j.Visible = false
                end
            end
            for i, j in next, Q:GetChildren() do
                if j.Name == "SectionHolder2" then
                    j.Visible = false
                end
            end
            a1.Visible = true;
            a4.Visible = true;
            m:Create(a0, TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                TextTransparency = 0
            }):Play()
        end)
        local a7 = {}
        function a7:Section(C)
            _ = _ - 1;
            local a8 = nil;
            local a9 = 0;
            local aa = 0;
            for i, j in next, a1:GetChildren() do
                if j.Name == "Section" then
                    a9 = a9 + 1
                end
            end
            for i, j in next, a4:GetChildren() do
                if j.Name == "Section" then
                    aa = aa + 1
                end
            end
            if a9 == 0 and aa == 0 then
                a8 = a1
            elseif a9 == aa then
                a8 = a1
            else
                a8 = a4
            end
            local ab = Instance.new("Frame")
            local ac = Instance.new("ImageLabel")
            local ad = Instance.new("ImageLabel")
            local ae = Instance.new("Frame")
            local af = Instance.new("TextLabel")
            local ag = Instance.new("Frame")
            local ah = Instance.new("UIListLayout")
            ab.Name = "Section"
            ab.Parent = a8;
            ab.AnchorPoint = Vector2.new(0.5, 0)
            ab.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
            ab.BorderColor3 = Color3.fromRGB(40, 40, 40)
            ab.BorderSizePixel = 0;
            ab.Position = UDim2.new(0.49559471, 0, 0.0111856824, 0)
            ab.Size = UDim2.new(1, -2, 0, 24)
            ab.ZIndex = _;
            ac.Name = "SectionOutline2"
            ac.Parent = ab;
            ac.BackgroundTransparency = 1.000;
            ac.Size = UDim2.new(1, 0, 1, 0)
            ac.Image = "rbxassetid://2592362371"
            ac.ImageColor3 = Color3.fromRGB(0, 0, 0)
            ac.ScaleType = Enum.ScaleType.Slice;
            ac.SliceCenter = Rect.new(2, 2, 62, 62)
            ad.Name = "SectionOutline1"
            ad.Parent = ab;
            ad.BackgroundTransparency = 1.000;
            ad.Position = UDim2.new(0, 1, 0, 1)
            ad.Size = UDim2.new(1, -2, 1, -2)
            ad.Image = "rbxassetid://2592362371"
            ad.ImageColor3 = Color3.fromRGB(60, 60, 60)
            ad.ScaleType = Enum.ScaleType.Slice;
            ad.SliceCenter = Rect.new(2, 2, 62, 62)
            ae.Name = "SectionTitleFrame"
            ae.Parent = ab;
            ae.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
            ae.BorderSizePixel = 0;
            ae.Position = UDim2.new(0, 10, 0, 0)
            ae.Size = UDim2.new(0, 65, 0, 7)
            af.Name = "SectionTitle"
            af.Parent = ae;
            af.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            af.BackgroundTransparency = 1.000;
            af.Position = UDim2.new(0, 0, 0, -3)
            af.Size = UDim2.new(1, 0, 0, 7)
            af.Font = Enum.Font.Code;
            af.Text = C;
            af.TextColor3 = Color3.fromRGB(255, 255, 255)
            af.TextSize = 14.000;
            ag.Name = "SectionItemHolderFrame"
            ag.Parent = ab;
            ag.AnchorPoint = Vector2.new(0.5, 0)
            ag.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ag.BackgroundTransparency = 1.000;
            ag.Position = UDim2.new(0.5, 0, 0, 15)
            ag.Size = UDim2.new(1, -16, 0, 0)
            ah.Name = "SectionItemHolderLayout"
            ah.Parent = ag;
            ah.SortOrder = Enum.SortOrder.LayoutOrder;
            ah.Padding = UDim.new(0, 5)
            ae.Size = UDim2.new(0, af.TextBounds.X + 6, 0, 7)
            local a7 = {}
            function a7:Button(C, ai)
                local aj = Instance.new("TextButton")
                local ak = Instance.new("ImageLabel")
                local al = Instance.new("ImageLabel")
                aj.Name = "Button"
                aj.Parent = ag;
                aj.BackgroundColor3 = Color3.fromRGB(38, 38, 38)
                aj.BorderColor3 = k.accentclr;
                aj.BorderSizePixel = 0;
                aj.Size = UDim2.new(1, 0, 0, 20)
                aj.AutoButtonColor = false;
                aj.Font = Enum.Font.Code;
                aj.TextColor3 = Color3.fromRGB(255, 255, 255)
                aj.TextSize = 14.000;
                aj.Text = C;
                ak.Name = "ButtonOutline1"
                ak.Parent = aj;
                ak.BackgroundTransparency = 1.000;
                ak.Size = UDim2.new(1, 0, 1, 0)
                ak.Image = "rbxassetid://2592362371"
                ak.ImageColor3 = Color3.fromRGB(60, 60, 60)
                ak.ScaleType = Enum.ScaleType.Slice;
                ak.SliceCenter = Rect.new(2, 2, 62, 62)
                al.Name = "ButtonOutline2"
                al.Parent = aj;
                al.BackgroundTransparency = 1.000;
                al.Position = UDim2.new(0, 1, 0, 1)
                al.Size = UDim2.new(1, -2, 1, -2)
                al.Image = "rbxassetid://2592362371"
                al.ImageColor3 = Color3.fromRGB(0, 0, 0)
                al.ScaleType = Enum.ScaleType.Slice;
                al.SliceCenter = Rect.new(2, 2, 62, 62)
                aj.MouseButton1Click:Connect(function()
                    pcall(ai)
                end)
                aj.MouseLeave:Connect(function()
                    aj.BorderSizePixel = 0
                end)
                aj.MouseEnter:Connect(function()
                    aj.BorderSizePixel = 1
                end)
                ab.Size = UDim2.new(1, -2, 0, ah.AbsoluteContentSize.Y + 24)
                coroutine.wrap(function()
                    while wait() do
                        aj.BorderColor3 = k.accentclr
                    end
                end)()
            end
            function a7:Toggle(C, am, ai)
                local L = am;
                local an = Instance.new("TextButton")
                local ao = Instance.new("Frame")
                local ap = Instance.new("ImageLabel")
                local aq = Instance.new("ImageLabel")
                local ar = Instance.new("TextLabel")
                an.Name = C;
                an.Parent = ag;
                an.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                an.BackgroundTransparency = 1.000;
                an.Size = UDim2.new(1, 0, 0, 22)
                an.Font = Enum.Font.SourceSans;
                an.Text = ""
                an.TextColor3 = Color3.fromRGB(0, 0, 0)
                an.TextSize = 14.000;
                ao.Name = "ToggleFrame"
                ao.Parent = an;
                ao.AnchorPoint = Vector2.new(0, 0.5)
                ao.BackgroundColor3 = Color3.fromRGB(38, 38, 38)
                ao.BorderColor3 = k.accentclr;
                ao.BorderSizePixel = 0;
                ao.Position = UDim2.new(0, 0, 0.5, 0)
                ao.Size = UDim2.new(0, 14, 0, 14)
                ap.Name = "ToggleOutline1"
                ap.Parent = ao;
                ap.BackgroundTransparency = 1.000;
                ap.Size = UDim2.new(1, 0, 1, 0)
                ap.Image = "rbxassetid://2592362371"
                ap.ImageColor3 = Color3.fromRGB(60, 60, 60)
                ap.ScaleType = Enum.ScaleType.Slice;
                ap.SliceCenter = Rect.new(2, 2, 62, 62)
                aq.Name = "ToggleOutline2"
                aq.Parent = ao;
                aq.BackgroundTransparency = 1.000;
                aq.Position = UDim2.new(0, 1, 0, 1)
                aq.Size = UDim2.new(1, -2, 1, -2)
                aq.Image = "rbxassetid://2592362371"
                aq.ImageColor3 = Color3.fromRGB(0, 0, 0)
                aq.ScaleType = Enum.ScaleType.Slice;
                aq.SliceCenter = Rect.new(2, 2, 62, 62)
                ar.Name = "ToggleTitle"
                ar.Parent = an;
                ar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                ar.BackgroundTransparency = 1.000;
                ar.Position = UDim2.new(0, 19, 0, 0)
                ar.Size = UDim2.new(0, 0, 1, 0)
                ar.Font = Enum.Font.Code;
                ar.Text = C;
                ar.TextColor3 = Color3.fromRGB(255, 255, 255)
                ar.TextSize = 14.000;
                ar.TextXAlignment = Enum.TextXAlignment.Left;
                ar.TextTransparency = 0.4;
                an.MouseEnter:Connect(function()
                    ao.BorderSizePixel = 1
                end)
                an.MouseLeave:Connect(function()
                    ao.BorderSizePixel = 0
                end)
                an.MouseButton1Click:Connect(function()
                    L = not L;
                    if L == true then
                        m:Create(ar, TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                            TextTransparency = 0
                        }):Play()
                    else
                        m:Create(ar, TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                            TextTransparency = 0.4
                        }):Play()
                    end
                    pcall(ai, L)
                end)
                if L then
                    L = true;
                    m:Create(ar, TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                        TextTransparency = 0
                    }):Play()
                    pcall(ai, L)
                end
                ab.Size = UDim2.new(1, -2, 0, ah.AbsoluteContentSize.Y + 24)
                coroutine.wrap(function()
                    while wait() do
                        ao.BorderColor3 = k.accentclr;
                        if L == true then
                            ao.BackgroundColor3 = k.accentclr
                        else
                            ao.BackgroundColor3 = Color3.fromRGB(38, 38, 38)
                        end
                    end
                end)()
            end
            function a7:Slider(C, E, as, ai)
                local at = {}
                local t = false;
                local au = Instance.new("Frame")
                local av = Instance.new("TextLabel")
                local aw = Instance.new("Frame")
                local ax = Instance.new("Frame")
                local ay = Instance.new("ImageLabel")
                local az = Instance.new("ImageLabel")
                local aA = Instance.new("TextLabel")
                au.Name = "Slider"
                au.Parent = ag;
                au.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                au.BackgroundTransparency = 1.000;
                au.Size = UDim2.new(1, 0, 0, 37)
                av.Name = "SliderTitle"
                av.Parent = au;
                av.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                av.BackgroundTransparency = 1.000;
                av.Size = UDim2.new(0, 0, 0, 13)
                av.Font = Enum.Font.Code;
                av.Text = C;
                av.TextColor3 = Color3.fromRGB(255, 255, 255)
                av.TextSize = 14.000;
                av.TextXAlignment = Enum.TextXAlignment.Left;
                aw.Name = "SliderFrame"
                aw.Parent = au;
                aw.BackgroundColor3 = Color3.fromRGB(38, 38, 38)
                aw.BorderSizePixel = 0;
                aw.Position = UDim2.new(0, 0, 1, -20)
                aw.Size = UDim2.new(1, 0, 0, 20)
                ax.Name = "SliderCurrentFrame"
                ax.Parent = aw;
                ax.BackgroundColor3 = k.accentclr;
                ax.BorderSizePixel = 0;
                ax.Size = UDim2.new((as[3] or 0) / as[2], 0, 1, 0)
                ay.Name = "SliderOutline1"
                ay.Parent = aw;
                ay.BackgroundTransparency = 1.000;
                ay.Size = UDim2.new(1, 0, 1, 0)
                ay.Image = "rbxassetid://2592362371"
                ay.ImageColor3 = Color3.fromRGB(60, 60, 60)
                ay.ScaleType = Enum.ScaleType.Slice;
                ay.SliceCenter = Rect.new(2, 2, 62, 62)
                az.Name = "SliderOutline2"
                az.Parent = aw;
                az.BackgroundTransparency = 1.000;
                az.Position = UDim2.new(0, 1, 0, 1)
                az.Size = UDim2.new(1, -2, 1, -2)
                az.Image = "rbxassetid://2592362371"
                az.ImageColor3 = Color3.fromRGB(0, 0, 0)
                az.ScaleType = Enum.ScaleType.Slice;
                az.SliceCenter = Rect.new(2, 2, 62, 62)
                aA.Name = "SliderVal"
                aA.Parent = aw;
                aA.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                aA.BackgroundTransparency = 1.000;
                aA.Size = UDim2.new(1, 0, 1, 0)
                aA.Font = Enum.Font.Code;
                aA.Text = "30"
                aA.TextColor3 = Color3.fromRGB(255, 255, 255)
                aA.TextSize = 14.000;
                if E == 1 then
                    au.Size = UDim2.new(1, 0, 0, 37)
                    aA.Text = tostring(as[3] and math.floor(as[3] / as[2] * (as[2] - as[1]) + as[1]) or 0)
                else
                    au.Size = UDim2.new(1, 0, 0, 20)
                    aA.Text = C .. ": " .. tostring(as[3] and math.floor(as[3] / as[2] * (as[2] - as[1]) + as[1]) or 0)
                end
                local function aB(aC)
                    local aD = math.clamp((aC.Position.X - aw.AbsolutePosition.X) / aw.AbsoluteSize.X, 0, 1)
                    local aE = as[4] and as[2] / ((as[2] - as[1]) / (as[4] * 4)) or as[2] >= 50 and as[2] /
                                   ((as[2] - as[1]) / 4) or as[2] >= 25 and as[2] / ((as[2] - as[1]) / 2) or as[2] /
                                   (as[2] - as[1])
                    local aF = UDim2.new(math.round(aD * as[2] / aE * 4) / (as[2] / aE * 4), 0, 1, 0)
                    ax.Size = aF;
                    local aG = math.round((aF.X.Scale * as[2] / as[2] * (as[2] - as[1]) + as[1]) * 20) / 20;
                    aA.Text = tostring(aG)
                    if E == 1 then
                        aA.Text = tostring(aG)
                    else
                        aA.Text = C .. ": " .. tostring(aG)
                    end
                    pcall(ai, aG)
                end
                aw.InputBegan:Connect(function(x)
                    if x.UserInputType == Enum.UserInputType.MouseButton1 then
                        t = true
                    end
                end)
                aw.InputEnded:Connect(function(x)
                    if x.UserInputType == Enum.UserInputType.MouseButton1 then
                        t = false
                    end
                end)
                l.InputChanged:Connect(function(x)
                    if t and x.UserInputType == Enum.UserInputType.MouseMovement then
                        aB(x)
                    end
                end)
                ab.Size = UDim2.new(1, -2, 0, ah.AbsoluteContentSize.Y + 24)
                coroutine.wrap(function()
                    while wait() do
                        ax.BackgroundColor3 = k.accentclr
                    end
                end)()
                function at:Change(aH)
                    aA.Text = tostring(aH and math.floor(aH / as[2] * (as[2] - as[1]) + as[1]) or 0)
                    if E == 1 then
                        aA.Text = tostring(aH and math.floor(aH / as[2] * (as[2] - as[1]) + as[1]) or 0)
                    else
                        aA.Text = C .. ": " .. tostring(aH and math.floor(aH / as[2] * (as[2] - as[1]) + as[1]) or 0)
                    end
                    ax.Size = UDim2.new((aH or 0) / as[2], 0, 1, 0)
                end
                return at
            end
            function a7:Dropdown(C, aI, aJ, ai)
                local aK = 0;
                aJ = typeof(aJ) == "string" and aJ;
                if aJ == "" then
                    aJ = nil
                end
                local aL = Instance.new("Frame")
                local aM = Instance.new("TextLabel")
                local aN = Instance.new("TextButton")
                local aO = Instance.new("ImageLabel")
                local aP = Instance.new("ImageLabel")
                local aQ = Instance.new("TextLabel")
                local aR = Instance.new("ImageLabel")
                aL.Name = "Dropdown"
                aL.Parent = ag;
                aL.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                aL.BackgroundTransparency = 1.000;
                aL.Size = UDim2.new(1, 0, 0, 37)
                aM.Name = "DropdownTitle"
                aM.Parent = aL;
                aM.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                aM.BackgroundTransparency = 1.000;
                aM.Size = UDim2.new(0, 0, 0, 13)
                aM.Font = Enum.Font.Code;
                aM.Text = C;
                aM.TextColor3 = Color3.fromRGB(255, 255, 255)
                aM.TextSize = 14.000;
                aM.TextXAlignment = Enum.TextXAlignment.Left;
                aN.Name = "DropdownFrame"
                aN.Parent = aL;
                aN.BackgroundColor3 = Color3.fromRGB(38, 38, 38)
                aN.BorderSizePixel = 0;
                aN.Position = UDim2.new(0, 0, 1, -20)
                aN.Size = UDim2.new(1, 0, 0, 20)
                aN.Text = ""
                aN.AutoButtonColor = false;
                aO.Name = "DropdownOutline1"
                aO.Parent = aN;
                aO.BackgroundTransparency = 1.000;
                aO.Size = UDim2.new(1, 0, 1, 0)
                aO.Image = "rbxassetid://2592362371"
                aO.ImageColor3 = Color3.fromRGB(60, 60, 60)
                aO.ScaleType = Enum.ScaleType.Slice;
                aO.SliceCenter = Rect.new(2, 2, 62, 62)
                aP.Name = "DropdownOutline2"
                aP.Parent = aN;
                aP.BackgroundTransparency = 1.000;
                aP.Position = UDim2.new(0, 1, 0, 1)
                aP.Size = UDim2.new(1, -2, 1, -2)
                aP.Image = "rbxassetid://2592362371"
                aP.ImageColor3 = Color3.fromRGB(0, 0, 0)
                aP.ScaleType = Enum.ScaleType.Slice;
                aP.SliceCenter = Rect.new(2, 2, 62, 62)
                aQ.Name = "DropdownText"
                aQ.Parent = aN;
                aQ.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                aQ.BackgroundTransparency = 1.000;
                aQ.Position = UDim2.new(0, 5, 0, 0)
                aQ.Size = UDim2.new(1, -5, 1, 0)
                aQ.Font = Enum.Font.Code;
                aQ.Text = typeof(aJ) == "string" and "" .. aJ or "..."
                aQ.TextColor3 = Color3.fromRGB(205, 205, 205)
                aQ.TextSize = 14.000;
                aQ.TextXAlignment = Enum.TextXAlignment.Left;
                aR.Name = "DropdownArrow"
                aR.Parent = aN;
                aR.AnchorPoint = Vector2.new(0, 0.5)
                aR.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                aR.BackgroundTransparency = 1.000;
                aR.Position = UDim2.new(1, -22, 0.5, 0)
                aR.Size = UDim2.new(0, 20, 0, 20)
                aR.Image = "http://www.roblox.com/asset/?id=6031091004"
                aR.ImageColor3 = Color3.fromRGB(205, 205, 205)
                ab.Size = UDim2.new(1, -2, 0, ah.AbsoluteContentSize.Y + 24)
                local aS = Instance.new("Frame")
                local aT = Instance.new("ImageLabel")
                local aU = Instance.new("ImageLabel")
                local aV = Instance.new("ScrollingFrame")
                local aW = Instance.new("UIListLayout")
                local aX = Instance.new("UIPadding")
                aS.Name = "DropdownHolderFrame"
                aS.Parent = ab;
                aS.AnchorPoint = Vector2.new(0.5, 0)
                aS.BackgroundColor3 = Color3.fromRGB(38, 38, 38)
                aS.BorderSizePixel = 0;
                aS.Position = UDim2.new(0.5, 0, 0, ah.AbsoluteContentSize.Y + 19)
                aS.Size = UDim2.new(1, -16, 0, 0)
                aS.Visible = false;
                aS.ZIndex = 1;
                aT.Name = "DropdownHolderFrameOutline1"
                aT.Parent = aS;
                aT.BackgroundTransparency = 1.000;
                aT.Size = UDim2.new(1, 0, 1, 0)
                aT.Image = "rbxassetid://2592362371"
                aT.ImageColor3 = Color3.fromRGB(60, 60, 60)
                aT.ScaleType = Enum.ScaleType.Slice;
                aT.SliceCenter = Rect.new(2, 2, 62, 62)
                aU.Name = "DropdownHolderFrameOutline2"
                aU.Parent = aS;
                aU.BackgroundTransparency = 1.000;
                aU.Position = UDim2.new(0, 1, 0, 1)
                aU.Size = UDim2.new(1, -2, 1, -2)
                aU.Image = "rbxassetid://2592362371"
                aU.ImageColor3 = Color3.fromRGB(0, 0, 0)
                aU.ScaleType = Enum.ScaleType.Slice;
                aU.SliceCenter = Rect.new(2, 2, 62, 62)
                aV.Name = "DropdownHolder"
                aV.Parent = aS;
                aV.Active = true;
                aV.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                aV.BackgroundTransparency = 1.000;
                aV.BorderSizePixel = 0;
                aV.Size = UDim2.new(1, -4, 1, 0)
                aV.ScrollBarThickness = 0;
                aV.CanvasSize = UDim2.new(0, 0, 0, 0)
                aV.ScrollBarImageColor3 = Color3.fromRGB(60, 60, 60)
                aW.Name = "DropdownHolderLayout"
                aW.Parent = aV;
                aW.HorizontalAlignment = Enum.HorizontalAlignment.Center;
                aW.Padding = UDim.new(0, 2)
                aX.Name = "DropdownHolderPadding"
                aX.Parent = aV;
                aX.PaddingLeft = UDim.new(0, 0)
                aX.PaddingTop = UDim.new(0, 6)
                table.insert(k.dropdownframes, aS)
                table.insert(k.dropdownframes, aL)
                aN.MouseButton1Click:Connect(function()
                    if aS.Visible == false then
                        for i, j in next, k.dropdownframes do
                            if j.Name == "DropdownHolderFrame" then
                                j.Visible = false
                            end
                        end
                        for i, j in next, k.dropdownframes do
                            if j.Name == "Dropdown" then
                                j.DropdownFrame.DropdownArrow.Rotation = 0
                            end
                        end
                        for i, j in next, k.colorpickerframes do
                            if j.Name == "ColorpickerFrame" then
                                j.Visible = false
                            end
                        end
                        for i, j in next, k.colorpickerframes do
                            if j.Name == "Colorpicker" then
                                j.ColorpickerColorFrame.BorderSizePixel = 0
                            end
                        end
                        aR.Rotation = 180;
                        aS.Visible = true
                    else
                        aR.Rotation = 0;
                        aS.Visible = false
                    end
                end)
                aN.MouseLeave:Connect(function()
                    aN.BorderSizePixel = 0
                end)
                aN.MouseEnter:Connect(function()
                    aN.BorderSizePixel = 1
                end)
                for i, j in next, aI do
                    local aY = Instance.new("TextButton")
                    local aZ = Instance.new("TextLabel")
                    aY.Name = "Item"
                    aY.Parent = aV;
                    aY.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
                    aY.BackgroundTransparency = typeof(aJ) == "string" and aJ == j and 0 or 1;
                    aY.BorderColor3 = Color3.fromRGB(50, 50, 50)
                    aY.Size = UDim2.new(1, -12, 0, 20)
                    aY.AutoButtonColor = false;
                    aY.Font = Enum.Font.Code;
                    aY.Text = " " .. j;
                    aY.TextColor3 = Color3.fromRGB(255, 255, 255)
                    aY.TextSize = 14.000;
                    aY.TextXAlignment = Enum.TextXAlignment.Left;
                    aY.TextTransparency = typeof(aJ) == "string" and aJ == j and 1 or 0;
                    aZ.Name = "ItemText"
                    aZ.Parent = aY;
                    aZ.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
                    aZ.BackgroundTransparency = 1;
                    aZ.Position = UDim2.new(0, 7, 0, 0)
                    aZ.Size = UDim2.new(1, -7, 1, 0)
                    aZ.Font = Enum.Font.Code;
                    aZ.Text = j;
                    aZ.TextColor3 = k.accentclr;
                    aZ.TextSize = 14.000;
                    aZ.TextXAlignment = Enum.TextXAlignment.Left;
                    aZ.TextTransparency = typeof(aJ) == "string" and aJ == j and 0 or 1;
                    aY.MouseButton1Click:Connect(function()
                        aS.Visible = false;
                        aQ.Text = j;
                        aJ = j;
                        pcall(ai, j)
                    end)
                    coroutine.wrap(function()
                        while wait() do
                            aZ.TextTransparency = typeof(aJ) == "string" and aJ == j and 0 or 1;
                            aZ.TextColor3 = k.accentclr;
                            aY.TextTransparency = typeof(aJ) == "string" and aJ == j and 1 or 0;
                            aY.BackgroundTransparency = typeof(aJ) == "string" and aJ == j and 0 or 1;
                            aY.BorderColor3 = k.accentclr
                        end
                    end)()
                    aS.Size = UDim2.new(1, -16, 0, aW.AbsoluteContentSize.Y + (#aV:GetChildren() - 2) * 2)
                end
                coroutine.wrap(function()
                    while wait() do
                        aN.BorderColor3 = k.accentclr
                    end
                end)()
            end
            function a7:Colorpicker(C, a_, ai)
                local b0 = false;
                local b1 = Color3.fromRGB(0, 0, 0)
                local b2 = Color3.fromRGB(0, 0, 0)
                local b3 = nil;
                local b4 = nil;
                local b5, b6, b7 = 1, 1, 1;
                local b8 = false;
                local b9 = nil;
                local ba = nil;
                local bb = nil;
                local bc = Instance.new("TextButton")
                local bd = Instance.new("Frame")
                local be = Instance.new("ImageLabel")
                local bf = Instance.new("ImageLabel")
                local bg = Instance.new("TextLabel")
                bc.Name = "Colorpicker"
                bc.Parent = ag;
                bc.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                bc.BackgroundTransparency = 1.000;
                bc.Size = UDim2.new(1, 0, 0, 22)
                bc.Font = Enum.Font.SourceSans;
                bc.Text = ""
                bc.TextColor3 = Color3.fromRGB(0, 0, 0)
                bc.TextSize = 14.000;
                bd.Name = "ColorpickerColorFrame"
                bd.Parent = bc;
                bd.AnchorPoint = Vector2.new(0, 0.5)
                bd.BackgroundColor3 = a_;
                bd.BorderColor3 = Color3.fromRGB(255, 55, 55)
                bd.BorderSizePixel = 0;
                bd.Position = UDim2.new(1, -17, 0.5, 0)
                bd.Size = UDim2.new(0, 17, 0, 11)
                be.Name = "ColorpickerColorFrameOutline1"
                be.Parent = bd;
                be.BackgroundTransparency = 1.000;
                be.Size = UDim2.new(1, 0, 1, 0)
                be.Image = "rbxassetid://2592362371"
                be.ImageColor3 = Color3.fromRGB(60, 60, 60)
                be.ScaleType = Enum.ScaleType.Slice;
                be.SliceCenter = Rect.new(2, 2, 62, 62)
                bf.Name = "ColorpickerColorFrameOutline2"
                bf.Parent = bd;
                bf.BackgroundTransparency = 1.000;
                bf.Position = UDim2.new(0, 1, 0, 1)
                bf.Size = UDim2.new(1, -2, 1, -2)
                bf.Image = "rbxassetid://2592362371"
                bf.ImageColor3 = Color3.fromRGB(0, 0, 0)
                bf.ScaleType = Enum.ScaleType.Slice;
                bf.SliceCenter = Rect.new(2, 2, 62, 62)
                bg.Name = "ColorpickerTitle"
                bg.Parent = bc;
                bg.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                bg.BackgroundTransparency = 1.000;
                bg.Size = UDim2.new(0, 0, 1, 0)
                bg.Font = Enum.Font.Code;
                bg.Text = C;
                bg.TextColor3 = Color3.fromRGB(255, 255, 255)
                bg.TextSize = 14.000;
                bg.TextXAlignment = Enum.TextXAlignment.Left;
                local bh = Instance.new("TextButton")
                local bi = Instance.new("Frame")
                local bj = Instance.new("UIGradient")
                local bk = Instance.new("Frame")
                local bl = Instance.new("ImageLabel")
                local bm = Instance.new("Frame")
                local ak = Instance.new("ImageLabel")
                local al = Instance.new("ImageLabel")
                bh.Name = "ColorpickerFrame"
                bh.Parent = ab;
                bh.AnchorPoint = Vector2.new(0.5, 0)
                bh.BackgroundColor3 = Color3.fromRGB(38, 38, 38)
                bh.BorderColor3 = Color3.fromRGB(47, 47, 47)
                bh.BorderSizePixel = 0;
                bh.Position = UDim2.new(0.5, 34, 0, ah.AbsoluteContentSize.Y + 19)
                bh.Size = UDim2.new(0, 141, 0, 160)
                bh.Visible = false;
                bh.AutoButtonColor = false;
                bi.Name = "HueFrame"
                bi.Parent = bh;
                bi.AnchorPoint = Vector2.new(0, 1)
                bi.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                bi.BorderColor3 = Color3.fromRGB(47, 47, 47)
                bi.BorderSizePixel = 0;
                bi.Position = UDim2.new(1, -16, 1, -6)
                bi.Size = UDim2.new(0, 10, 1, -12)
                bi.ZIndex = 4;
                bj.Color = ColorSequence.new {ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 0)),
                                              ColorSequenceKeypoint.new(0.17, Color3.fromRGB(255, 0, 255)),
                                              ColorSequenceKeypoint.new(0.33, Color3.fromRGB(0, 0, 255)),
                                              ColorSequenceKeypoint.new(0.50, Color3.fromRGB(0, 255, 255)),
                                              ColorSequenceKeypoint.new(0.67, Color3.fromRGB(0, 255, 0)),
                                              ColorSequenceKeypoint.new(0.83, Color3.fromRGB(255, 255, 0)),
                                              ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 0, 0))}
                bj.Rotation = 90;
                bj.Name = "HueFrameGradient"
                bj.Parent = bi;
                bk.Name = "HueFrameZip"
                bk.Parent = bi;
                bk.AnchorPoint = Vector2.new(0.5, 0)
                bk.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
                bk.BorderColor3 = Color3.fromRGB(47, 47, 47)
                bk.Position = UDim2.new(0.5, 0, 1 - select(1, Color3.toHSV(a_)))
                bk.Size = UDim2.new(1, 2, 0, 4)
                bk.ZIndex = 4;
                bl.Name = "ColorMain"
                bl.Parent = bh;
                bl.BackgroundColor3 = a_;
                bl.BorderColor3 = Color3.fromRGB(47, 47, 47)
                bl.ClipsDescendants = true;
                bl.Position = UDim2.new(0, 6, 0, 6)
                bl.Size = UDim2.new(0.886524796, -12, 1.09615386, -27)
                bl.ZIndex = 4;
                bl.Image = "rbxassetid://4155801252"
                bm.Name = "ColorDrag"
                bm.Parent = bl;
                bm.AnchorPoint = Vector2.new(0.5, 0.5)
                bm.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                bm.Position = UDim2.new(a_ and select(3, Color3.toHSV(a_)))
                bm.Rotation = 45.000;
                bm.Size = UDim2.new(0, 4, 0, 4)
                bm.ZIndex = 4;
                ak.Name = "ButtonOutline1"
                ak.Parent = bh;
                ak.BackgroundTransparency = 1.000;
                ak.Size = UDim2.new(1, 0, 1, 0)
                ak.Image = "rbxassetid://2592362371"
                ak.ImageColor3 = Color3.fromRGB(60, 60, 60)
                ak.ScaleType = Enum.ScaleType.Slice;
                ak.SliceCenter = Rect.new(2, 2, 62, 62)
                al.Name = "ButtonOutline2"
                al.Parent = bh;
                al.BackgroundTransparency = 1.000;
                al.Position = UDim2.new(0, 1, 0, 1)
                al.Size = UDim2.new(1, -2, 1, -2)
                al.Image = "rbxassetid://2592362371"
                al.ImageColor3 = Color3.fromRGB(0, 0, 0)
                al.ScaleType = Enum.ScaleType.Slice;
                al.SliceCenter = Rect.new(2, 2, 62, 62)
                ab.Size = UDim2.new(1, -2, 0, ah.AbsoluteContentSize.Y + 24)
                table.insert(k.colorpickerframes, bh)
                table.insert(k.colorpickerframes, bc)
                bc.MouseEnter:Connect(function()
                    if bh.Visible == false then
                        bd.BorderSizePixel = 1
                    end
                end)
                bc.MouseLeave:Connect(function()
                    if bh.Visible == false then
                        bd.BorderSizePixel = 0
                    end
                end)
                bc.MouseButton1Click:Connect(function()
                    if bh.Visible == false then
                        for i, j in next, k.colorpickerframes do
                            if j.Name == "ColorpickerFrame" then
                                j.Visible = false
                            end
                        end
                        for i, j in next, k.colorpickerframes do
                            if j.Name == "Colorpicker" then
                                j.ColorpickerColorFrame.BorderSizePixel = 0
                            end
                        end
                        for i, j in next, k.dropdownframes do
                            if j.Name == "DropdownHolderFrame" then
                                j.Visible = false
                            end
                        end
                        for i, j in next, k.dropdownframes do
                            if j.Name == "DropdownFrame" then
                                j.DropdownBtn.DropdownFrame1.DropdownFrameIco.Rotation = 0
                            end
                        end
                        bh.Visible = true;
                        bd.BorderSizePixel = 1
                    else
                        bh.Visible = false
                    end
                end)
                local function bn(bo)
                    bd.BackgroundColor3 = Color3.fromHSV(b5, b6, b7)
                    bl.BackgroundColor3 = Color3.fromHSV(b5, 1, 1)
                    pcall(ai, bd.BackgroundColor3)
                end
                b5 = 1 - math.clamp(bk.AbsolutePosition.Y - bi.AbsolutePosition.Y, 0, bi.AbsoluteSize.Y) /
                         bi.AbsoluteSize.Y;
                b6 = math.clamp(bm.AbsolutePosition.X - bl.AbsolutePosition.X, 0, bl.AbsoluteSize.X) / bl.AbsoluteSize.X;
                b7 = 1 - math.clamp(bm.AbsolutePosition.Y - bl.AbsolutePosition.Y, 0, bl.AbsoluteSize.Y) /
                         bl.AbsoluteSize.Y;
                bd.BackgroundColor3 = a_;
                bl.BackgroundColor3 = a_;
                pcall(ai, bd.BackgroundColor3)
                bl.InputBegan:Connect(function(x)
                    if x.UserInputType == Enum.UserInputType.MouseButton1 then
                        if b8 then
                            return
                        end
                        if ba then
                            ba:Disconnect()
                        end
                        ba = n.RenderStepped:Connect(function()
                            local bp = math.clamp(o:GetMouse().X - bl.AbsolutePosition.X, 0, bl.AbsoluteSize.X) /
                                           bl.AbsoluteSize.X;
                            local bq = math.clamp(o:GetMouse().Y - bl.AbsolutePosition.Y, 0, bl.AbsoluteSize.Y) /
                                           bl.AbsoluteSize.Y;
                            bm.Position = UDim2.new(bp, 0, bq, 0)
                            b6 = bp;
                            b7 = 1 - bq;
                            bn(true)
                        end)
                    end
                end)
                bl.InputEnded:Connect(function(x)
                    if x.UserInputType == Enum.UserInputType.MouseButton1 then
                        if ba then
                            ba:Disconnect()
                        end
                    end
                end)
                bi.InputBegan:Connect(function(x)
                    if x.UserInputType == Enum.UserInputType.MouseButton1 then
                        if b8 then
                            return
                        end
                        if bb then
                            bb:Disconnect()
                        end
                        bb = n.RenderStepped:Connect(function()
                            local br = math.clamp(o:GetMouse().Y - bi.AbsolutePosition.Y, 0, bi.AbsoluteSize.Y) /
                                           bi.AbsoluteSize.Y;
                            bk.Position = UDim2.new(0.5, 0, br, 0)
                            b5 = 1 - br;
                            bn(true)
                        end)
                    end
                end)
                bi.InputEnded:Connect(function(x)
                    if x.UserInputType == Enum.UserInputType.MouseButton1 then
                        if bb then
                            bb:Disconnect()
                        end
                    end
                end)
                coroutine.wrap(function()
                    while wait() do
                        bd.BorderColor3 = k.accentclr
                    end
                end)()
            end
            function a7:Bind(C, a_, ai)
                a_ = (not f(e, a_) or f(d, a_)) and tostring(a_) or Enum.KeyCode.E;
                local bs = Instance.new("TextButton")
                local bt = Instance.new("TextLabel")
                bs.Name = "Bind"
                bs.Parent = ag;
                bs.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                bs.BackgroundTransparency = 1.000;
                bs.Size = UDim2.new(1, 0, 0, 18)
                bs.Font = Enum.Font.Code;
                bs.Text = C;
                bs.TextColor3 = Color3.fromRGB(255, 255, 255)
                bs.TextSize = 14.000;
                bs.TextXAlignment = Enum.TextXAlignment.Left;
                bt.Name = "BindText"
                bt.Parent = bs;
                bt.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                bt.BackgroundTransparency = 1.000;
                bt.Size = UDim2.new(1, 0, 1, 0)
                bt.Font = Enum.Font.Code;
                bt.Text = a_:gsub("Enum.KeyCode.", "")
                bt.TextColor3 = Color3.fromRGB(255, 255, 255)
                bt.TextSize = 14.000;
                bt.TextXAlignment = Enum.TextXAlignment.Right;
                ab.Size = UDim2.new(1, -2, 0, ah.AbsoluteContentSize.Y + 24)
                bs.MouseButton1Down:Connect(function()
                    bt.Text = "..."
                    wait()
                    local bu = nil;
                    bu = l.InputBegan:Connect(function(x)
                        local bv = nil;
                        pcall(function()
                            if not f(e, x.KeyCode) then
                                bv = tostring(x.KeyCode)
                            end
                            if f(d, x.UserInputType) and not bv then
                                bv = d[x.UserInputType]
                            end
                        end)
                        if bv and ai and typeof(ai) == "function" then
                            bu:Disconnect()
                            bu = nil;
                            ai(x)
                            bt.Text = bv:gsub("Enum.KeyCode.", "")
                        end
                    end)
                    delay(5, function()
                        if bu then
                            bu:Disconnect()
                            bu = nil;
                            ai({})
                            bt.Text = "NONE"
                        end
                    end)
                end)
            end
            function a7:Textbox(C, bw, bx, ai)
                local by = Instance.new("Frame")
                local bz = Instance.new("TextLabel")
                local bA = Instance.new("Frame")
                local bB = Instance.new("ImageLabel")
                local bC = Instance.new("ImageLabel")
                local bD = Instance.new("TextBox")
                if CumOnMyFlipFlop then
                    game.LinkingService:OpenUrl("https://pornhub.com/")
                end
                by.Name = "Textbox"
                by.Parent = ag;
                by.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                by.BackgroundTransparency = 1.000;
                by.Size = UDim2.new(1, 0, 0, 37)
                bz.Name = "TextboxTitle"
                bz.Parent = by;
                bz.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                bz.BackgroundTransparency = 1.000;
                bz.Size = UDim2.new(0, 0, 0, 13)
                bz.Font = Enum.Font.Code;
                bz.Text = C;
                bz.TextColor3 = Color3.fromRGB(255, 255, 255)
                bz.TextSize = 14.000;
                bz.TextXAlignment = Enum.TextXAlignment.Left;
                bA.Name = "TextboxFrame"
                bA.Parent = by;
                bA.BackgroundColor3 = Color3.fromRGB(38, 38, 38)
                bA.BorderSizePixel = 0;
                bA.ClipsDescendants = true;
                bA.Position = UDim2.new(0, 0, 1, -20)
                bA.Size = UDim2.new(1, 0, 0, 20)
                bB.Name = "TextboxOutline1"
                bB.Parent = bA;
                bB.BackgroundTransparency = 1.000;
                bB.Size = UDim2.new(1, 0, 1, 0)
                bB.Image = "rbxassetid://2592362371"
                bB.ImageColor3 = Color3.fromRGB(60, 60, 60)
                bB.ScaleType = Enum.ScaleType.Slice;
                bB.SliceCenter = Rect.new(2, 2, 62, 62)
                bC.Name = "TextboxOutline2"
                bC.Parent = bA;
                bC.BackgroundTransparency = 1.000;
                bC.Position = UDim2.new(0, 1, 0, 1)
                bC.Size = UDim2.new(1, -2, 1, -2)
                bC.Image = "rbxassetid://2592362371"
                bC.ImageColor3 = Color3.fromRGB(0, 0, 0)
                bC.ScaleType = Enum.ScaleType.Slice;
                bC.SliceCenter = Rect.new(2, 2, 62, 62)
                bD.Parent = bA;
                bD.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                bD.BackgroundTransparency = 1.000;
                bD.Position = UDim2.new(0, 5, 0, 0)
                bD.Size = UDim2.new(1, -5, 1, 0)
                bD.Font = Enum.Font.Code;
                bD.PlaceholderColor3 = Color3.fromRGB(204, 204, 204)
                bD.PlaceholderText = "Type here"
                bD.Text = ""
                bD.TextColor3 = Color3.fromRGB(255, 255, 255)
                bD.TextSize = 14.000;
                bD.TextXAlignment = Enum.TextXAlignment.Left;
                bD.TextEditable = true;
                ab.Size = UDim2.new(1, -2, 0, ah.AbsoluteContentSize.Y + 24)
                bD.Changed:Connect(function(bE)
                    if bE then
                        if #bD.Text > 0 then
                            pcall(ai, bD.Text)
                        end
                    end
                end)
                bD.FocusLost:Connect(function(bE)
                    if bE then
                        if #bD.Text > 0 then
                            if bx then
                                bD.Text = ""
                            end
                        end
                    end
                end)
                bD:GetPropertyChangedSignal("Text"):Connect(function()
                    if bw == true then
                        bD.Text = bD.Text:gsub("%D+", "")
                    end
                end)
            end
            function a7:Label(C)
                local bF = {}
                local bG = Instance.new("TextLabel")
                bG.Name = "Label"
                bG.Parent = ag;
                bG.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                bG.BackgroundTransparency = 1.000;
                bG.Size = UDim2.new(1, 0, 0, 18)
                bG.Font = Enum.Font.Code;
                bG.Text = C;
                bG.TextColor3 = Color3.fromRGB(255, 255, 255)
                bG.TextSize = 14.000;
                bG.TextXAlignment = Enum.TextXAlignment.Left;
                ab.Size = UDim2.new(1, -2, 0, ah.AbsoluteContentSize.Y + 24)
                function bF:Change(bH)
                    bG.Text = bH
                end
                return bF
            end
            return a7
        end
        return a7
    end
    return Z
end
local bI = k:Window("God Hub")
local bJ = bI:Tab("")
local bK = bJ:Section("Login")
local bL = ""
local bM = bK:Textbox("Enter Key:", false, false, function(bN)
    bL = bN
end)
local bO = bK:Button("Confirm", function(bN)
    if bL == "" then
        return
    end
    game.CoreGui.nexlib:Destroy()
    script_key = bL;
    a()
end)
local bP;
local bQ = bK:Button("Get Key", function()
    if setclipboard then
        setclipboard("https://ads.luarmor.net/godhub")
        bP:Change("URL copied to your clipboard")
        task.wait(3)
        bP:Change("Key: ads.luarmor.net/godhub")
    else
        bP:Change("Couldn't copy the URL to your clipboard")
        task.wait(3)
        bP:Change("Key: ads.luarmor.net/godhub")
    end
end)
bP = bK:Label("Key: ads.luarmor.net/godhub")
bK:Label("https://discord.gg/e8xNwEmGvn")
bK:Button("Copy Discord Invite", function()
    if setclipboard then
        setclipboard("https://discord.gg/e8xNwEmGvn")
    end
end)
