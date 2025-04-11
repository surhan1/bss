print("executed")
local workspace = game:GetService("Workspace")
local hiddenStickersFolder = workspace:FindFirstChild("HiddenStickers")

local function updateHiddenStickers()
    for _, child in ipairs(hiddenStickersFolder:GetChildren()) do
        for _, descendant in ipairs(child:GetDescendants()) do
            if descendant:IsA("BillboardGui") then
                descendant:Destroy()
            end
        end
    end
    
    for _, sticker in ipairs(hiddenStickersFolder:GetChildren()) do
        if sticker:IsA("BasePart") then
            sticker.Material = Enum.Material.Neon
            sticker.Color = Color3.fromRGB(0, 255, 0)
           
            local billboardGui = Instance.new("BillboardGui")
            billboardGui.Adornee = sticker
            billboardGui.Size = UDim2.new(0, 200, 0, 50) 
            billboardGui.AlwaysOnTop = true
            billboardGui.LightInfluence = 0 
            
            local textLabel = Instance.new("TextLabel")
            textLabel.Size = UDim2.new(1, 0, 1, 0)
            textLabel.BackgroundTransparency = 1
            textLabel.Text = "Hidden Sticker"
            textLabel.TextColor3 = Color3.fromRGB(255, 255, 255) 
            textLabel.TextScaled = true
            textLabel.Font = Enum.Font.SourceSansBold 
            textLabel.Parent = billboardGui
            
            billboardGui.Parent = sticker
        end
    end
end

while true do
    if hiddenStickersFolder then
        updateHiddenStickers()
    else
        warn("Folder 'HiddenStickers' not found in Workspace.")
    end
    wait(5) 
end