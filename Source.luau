-- Hello there. If you don't want to participate in the count, simply click the "only if you don't trust it" option, or run "main" directly. It is 100% open-source, except for the counting mechanism; that part uses keys, which poses a risk for me—I apologize, but it is necessary for the project's security.
-- project by joaopk(scord)

local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")

local CountGui = Instance.new("ScreenGui")
CountGui.Name = "Count"
CountGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
CountGui.Parent = Players.LocalPlayer:WaitForChild("PlayerGui")

local MainFrame = Instance.new("Frame")
MainFrame.Name = "Count"
MainFrame.Size = UDim2.new(0, 222, 0, 126)
MainFrame.Position = UDim2.new(0, 284, 0, 14)
MainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
MainFrame.BackgroundTransparency = 1
MainFrame.BorderSizePixel = 0
MainFrame.Parent = CountGui

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Name = "?"
TitleLabel.Size = UDim2.new(0, 202, 0, 64)
TitleLabel.Position = UDim2.new(0, 8, 0, -12)
TitleLabel.BackgroundTransparency = 1
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.TextTransparency = 1
TitleLabel.BorderSizePixel = 0
TitleLabel.Text = "Does its execution matter?"
TitleLabel.Parent = MainFrame

local DescLabel = Instance.new("TextLabel")
DescLabel.Name = "?"
DescLabel.Size = UDim2.new(0, 202, 0, 64)
DescLabel.Position = UDim2.new(0, 14, 0, 32)
DescLabel.BackgroundTransparency = 1
DescLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
DescLabel.TextTransparency = 1
DescLabel.BorderSizePixel = 0
DescLabel.TextScaled = true
DescLabel.TextWrapped = true
DescLabel.Text = "By accepting, you agree to let an obfuscated script run on your client; the script is simply a counter, obfuscated to protect against spam attacks. Please respect this—if you do not trust it and simply want to run it without counting the execution, you can simply click \"No\"!"
DescLabel.Parent = MainFrame

local YesBtn = Instance.new("TextButton")
YesBtn.Size = UDim2.new(0, 92, 0, 28)
YesBtn.Position = UDim2.new(0, 4, 0, 96)
YesBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
YesBtn.BackgroundTransparency = 1
YesBtn.TextColor3 = Color3.fromRGB(93, 255, 31)
YesBtn.TextTransparency = 1
YesBtn.BorderSizePixel = 0
YesBtn.Text = "yep"
YesBtn.Parent = MainFrame

local NoBtn = Instance.new("TextButton")
NoBtn.Size = UDim2.new(0, 92, 0, 28)
NoBtn.Position = UDim2.new(0, 126, 0, 96)
NoBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
NoBtn.BackgroundTransparency = 1
NoBtn.TextColor3 = Color3.fromRGB(255, 0, 0)
NoBtn.TextTransparency = 1
NoBtn.BorderSizePixel = 0
NoBtn.Text = "no"
NoBtn.Parent = MainFrame

local function animateHover(button)
    button.MouseEnter:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(200, 200, 200)}):Play()
    end)
    button.MouseLeave:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(255, 255, 255)}):Play()
    end)
end

animateHover(YesBtn)
animateHover(NoBtn)

local function executeLogic(choice)
    local fadeOut = TweenInfo.new(0.3)
    TweenService:Create(MainFrame, fadeOut, {BackgroundTransparency = 1}):Play()
    TweenService:Create(TitleLabel, fadeOut, {TextTransparency = 1}):Play()
    TweenService:Create(DescLabel, fadeOut, {TextTransparency = 1}):Play()
    TweenService:Create(YesBtn, fadeOut, {BackgroundTransparency = 1, TextTransparency = 1}):Play()
    local tweenWait = TweenService:Create(NoBtn, fadeOut, {BackgroundTransparency = 1, TextTransparency = 1})
    
    tweenWait:Play()
    tweenWait.Completed:Wait()
    CountGui:Destroy()

    if choice == "yep" then
        task.spawn(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/luayrbx-afk/beaconProV2/refs/heads/main/Main"))()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/luayrbx-afk/beaconProV2/refs/heads/main/Assets/Count"))()
        end)
    else
        task.spawn(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/luayrbx-afk/beaconProV2/refs/heads/main/Main"))()
        end)
    end
end

YesBtn.MouseButton1Click:Connect(function() executeLogic("yep") end)
NoBtn.MouseButton1Click:Connect(function() executeLogic("no") end)

local fadeIn = TweenInfo.new(0.5)
TweenService:Create(MainFrame, fadeIn, {BackgroundTransparency = 0}):Play()
TweenService:Create(TitleLabel, fadeIn, {TextTransparency = 0}):Play()
TweenService:Create(DescLabel, fadeIn, {TextTransparency = 0}):Play()
TweenService:Create(YesBtn, fadeIn, {BackgroundTransparency = 0, TextTransparency = 0}):Play()
TweenService:Create(NoBtn, fadeIn, {BackgroundTransparency = 0, TextTransparency = 0}):Play()
