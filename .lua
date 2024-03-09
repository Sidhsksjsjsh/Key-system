local ks = {}

function GenRandomString()
    local length = math.random(10,20)
    local array = {}
    for i = 1, length do
        array[i] = string.char(math.random(32, 126))
    end
    return table.concat(array)
end

local function close(frm,ui)
	frm:TweenSize(UDim2.new(0,0,0,0),Enum.EasingDirection.Out,Enum.EasingStyle.Quart,.6,true,function()
		ui:Destroy()
	end)
end

local function open(frm)
	frm:TweenSize(UDim2.new(0,371,0,315),Enum.EasingDirection.Out,Enum.EasingStyle.Quart,.6,true)
end

local function dragify(Frame)
	dragToggle = nil
	dragSpeed = 0.25
	dragInput = nil
	dragStart = nil
	dragPos = nil
	function updateInput(input)
		Delta = input.Position - dragStart
		Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + Delta.X, startPos.Y.Scale, startPos.Y.Offset + Delta.Y)
		game:GetService("TweenService"):Create(Frame, TweenInfo.new(.25), {
			Position = Position
		}):Play()
	end
	Frame.InputBegan:Connect(function(input)
		if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
			dragToggle = true
			dragStart = input.Position
			startPos = Frame.Position
			input.Changed:Connect(function()
				if (input.UserInputState == Enum.UserInputState.End) then
					dragToggle = false
				end
			end)
		end
	end)
	Frame.InputChanged:Connect(function(input)
		if (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
			dragInput = input
		end
	end)
	game:GetService("UserInputService").InputChanged:Connect(function(input)
		if (input == dragInput and dragToggle) then
			updateInput(input)
		end
	end)
end

function ks:CreateUI(Config)
    local Title = Config.Title or "Key System"
    local KeyShit = Config.Key or nil
    local KeyUrl = Config.KeyUrl or nil

    local LoadFunction = Config.LoadFunction or Config.Load or Config.Callback or function() return warn("Callback not given") end

    if KeyShit == nil then
        return error("Key not given (missing \"Key\")")
    end
    -- Instances:

    local KeySystem = Instance.new("ScreenGui")
    local Frame2 = Instance.new("Frame")
    local UICorner = Instance.new("UICorner")
    local Key = Instance.new("TextBox")
    local UICorner_2 = Instance.new("UICorner")
    local WebsiteLabel = Instance.new("TextLabel")
    local MainLabel = Instance.new("TextLabel")
    local Exit = Instance.new("TextButton")
    local Redeem = Instance.new("TextButton")
    local UICorner_3 = Instance.new("UICorner")
    local UICorner_4 = Instance.new("UICorner")
    local UICorner_5 = Instance.new("UICorner") -- from this
    local UIAspectRatioConstraints = Instance.new("UIAspectRatioConstraint")
    --local UICorners = Instance.new("UICorner")
    local UIListLayouts = Instance.new("UIListLayout") -- to this
	
    --Properties:

    KeySystem.Name = GenRandomString()
    KeySystem.Parent = game:GetService("CoreGui")
    KeySystem.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    Frame2.Name = GenRandomString()
    Frame2.Parent = KeySystem
    Frame2.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
    Frame2.Position = UDim2.new(0.330283642,0,0.235785931,0)
    Frame2.Size = UDim2.new(0,0,0,0)

    UIAspectRatioConstraints.Parent = Frame2 -- from
    UIAspectRatioConstraints.AspectRatio = 2.000

    UIListLayouts.Parent = Frame2
    UIListLayouts.HorizontalAlignment = Enum.HorizontalAlignment.Center
    UIListLayouts.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayouts.VerticalAlignment = Enum.VerticalAlignment.Center
    UIListLayouts.Padding = UDim.new(.05,0)

    UICorner.Parent = Frame2 -- not
    UICorner.CornerRadius = UDim.new(.1,0) -- this
	
    Key.Name = GenRandomString()
    Key.Parent = Frame2
    Key.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    Key.BorderSizePixel = 0
    Key.Position = UDim2.new(0.0269541778, 0, 0.412263513, 0)
    Key.Size = UDim2.new(0, 350, 0, 55)
    Key.Font = Enum.Font.SourceSans
    Key.Text = "Key Here!"
    Key.TextColor3 = Color3.fromRGB(255, 255, 255)
    Key.TextSize = 14.000
    Key.TextTransparency = 0.500
    Key.TextWrapped = true

    UICorner_2.Parent = Key
    UICorner_2.CornerRadius = UDim.new(.1,0)
	
    if KeyUrl then
        local WebsiteLabel = Instance.new("TextLabel")
        WebsiteLabel.Name = "WebsiteLabel"
        WebsiteLabel.Parent = Frame2
        WebsiteLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        WebsiteLabel.BackgroundTransparency = 1.000
        WebsiteLabel.Position = UDim2.new(0.253369272, 0, 0.200000003, 0)
        WebsiteLabel.Size = UDim2.new(0, 181, 0, 50)
        WebsiteLabel.Font = Enum.Font.SourceSans
        WebsiteLabel.Text = tostring(KeyUrl)
        WebsiteLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        WebsiteLabel.TextSize = 14.000
        WebsiteLabel.TextTransparency = 0.700
    end

    MainLabel.Name = GenRandomString()
    MainLabel.Parent = Frame2
    MainLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    MainLabel.BackgroundTransparency = 1.000
    MainLabel.Position = UDim2.new(0, 0, 0.0190476198, 0)
    MainLabel.Size = UDim2.new(0, 371, 0, 50)
    MainLabel.Font = Enum.Font.Gotham
    MainLabel.Text = tostring(Title)
    MainLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    MainLabel.TextScaled = true
    MainLabel.TextSize = 14.000
    MainLabel.TextStrokeTransparency = 0.500
    MainLabel.TextWrapped = true

    Exit.Name = GenRandomString()
    Exit.Parent = Frame2
    Exit.BackgroundColor3 = Color3.fromRGB(33, 0, 0)
    Exit.BorderSizePixel = 0
    Exit.Position = UDim2.new(0.90296495, 0, 0, 0)
    Exit.Size = UDim2.new(0, 36, 0, 30)
    Exit.Font = Enum.Font.Gotham
    Exit.Text = "X"
    Exit.TextColor3 = Color3.fromRGB(255, 255, 255)
    Exit.TextScaled = true
    Exit.TextSize = 14.000
    Exit.TextTransparency = 0.700
    Exit.TextWrapped = true
    UICorner_5.Parent = Exit
    UICorner_5.CornerRadius = UDim.new(.1,0)
	
    Redeem.Name = GenRandomString()
    Redeem.Parent = Frame2
    Redeem.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    Redeem.BorderSizePixel = 0
    Redeem.Position = UDim2.new(0.202156335, 0, 0.69206351, 0)
    Redeem.Size = UDim2.new(0, 219, 0, 30)
    Redeem.Font = Enum.Font.Gotham
    Redeem.Text = "Redeem"
    Redeem.TextColor3 = Color3.fromRGB(255, 255, 255)
    Redeem.TextScaled = true
    Redeem.TextSize = 14.000
    Redeem.TextTransparency = 0.700
    Redeem.TextWrapped = true

    UICorner_3.Parent = Redeem
    UICorner_3.CornerRadius = UDim.new(.1,0)
	
    if KeyUrl and setclipboard then
        local CopyLink = Instance.new("TextButton")
        CopyLink.Name = GenRandomString()
        CopyLink.Parent = Frame2
        CopyLink.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
        CopyLink.BorderSizePixel = 0
        CopyLink.Position = UDim2.new(0.202156335, 0, 0.812698424, 0)
        CopyLink.Size = UDim2.new(0, 219, 0, 30)
        CopyLink.Font = Enum.Font.Gotham
        CopyLink.Text = "Copy Link"
        CopyLink.TextColor3 = Color3.fromRGB(255, 255, 255)
        CopyLink.TextScaled = true
        CopyLink.TextSize = 14.000
        CopyLink.TextTransparency = 0.700
        CopyLink.TextWrapped = true

        UICorner_4.Parent = CopyLink
        UICorner_4.CornerRadius = UDim.new(.1,0)
        CopyLink.MouseButton1Click:Connect(function()
            setclipboard(tostring(KeyUrl))
        end)
    end

    Redeem.MouseButton1Click:Connect(function()
      for i,v in pairs(KeyShit) do
        if Key.Text == v then
            LoadFunction()
            task.wait()
            --KeySystem:Destroy()
	    close(Frame2,KeySystem)
        end
	end
    end)

    Exit.MouseButton1Click:Connect(function()
        task.wait()
        --KeySystem:Destroy()
	close(Frame2,KeySystem)
    end)

    open(Frame2)
    dragify(Frame2)
end

return ks;
