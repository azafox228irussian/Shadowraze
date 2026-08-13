-- ===========================================================
--  SHADOWRAZE FULL SCRIPT (с лого-интро)
--  Загрузка с GitHub: https://raw.githubusercontent.com/azafox228irussian/Shadowraze/main/main.lua
-- ===========================================================

-- ===========================================================
--  SHADOWRAZE LOGO INTRO (с анимацией) - ВСТРОЕННЫЙ
-- ===========================================================

local function ShowShadowrazeIntro()
    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer
    local RunService = game:GetService("RunService")
    
    if getgenv()._ShadowrazeIntroShown then return end
    getgenv()._ShadowrazeIntroShown = true
    
    repeat task.wait() until game:IsLoaded()
    
    local gui = Instance.new("ScreenGui")
    gui.Name = "ShadowrazeIntro"
    gui.IgnoreGuiInset = true
    gui.ZIndexBehavior = Enum.ZIndexBehavior.Global
    gui.Parent = game:GetService("CoreGui")
    
    -- Фон
    local background = Instance.new("Frame")
    background.Name = "Background"
    background.Size = UDim2.new(1, 0, 1, 0)
    background.BackgroundColor3 = Color3.fromRGB(8, 8, 16)
    background.BackgroundTransparency = 1
    background.BorderSizePixel = 0
    background.Parent = gui
    
    local gradient = Instance.new("UIGradient")
    gradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(8, 8, 16)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(16, 10, 30)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(8, 8, 16)),
    })
    gradient.Rotation = 45
    gradient.Parent = background
    
    -- Логотип
    local logoFrame = Instance.new("Frame")
    logoFrame.Name = "LogoFrame"
    logoFrame.Size = UDim2.new(0, 300, 0, 300)
    logoFrame.Position = UDim2.new(0.5, -150, 0.5, -200)
    logoFrame.BackgroundTransparency = 1
    logoFrame.Parent = gui
    
    local logoBg = Instance.new("Frame")
    logoBg.Name = "LogoBg"
    logoBg.Size = UDim2.new(1, 0, 1, 0)
    logoBg.BackgroundColor3 = Color3.fromRGB(30, 25, 50)
    logoBg.BackgroundTransparency = 0.3
    logoBg.BorderSizePixel = 0
    logoBg.Parent = logoFrame
    
    local logoBgCorner = Instance.new("UICorner")
    logoBgCorner.CornerRadius = UDim.new(0, 20)
    logoBgCorner.Parent = logoBg
    
    local logoStroke = Instance.new("UIStroke")
    logoStroke.Color = Color3.fromRGB(100, 80, 200)
    logoStroke.Thickness = 2
    logoStroke.Transparency = 0.5
    logoStroke.Parent = logoFrame
    
    -- Заголовок
    local mainTitle = Instance.new("TextLabel")
    mainTitle.Name = "MainTitle"
    mainTitle.Size = UDim2.new(1, 0, 0, 60)
    mainTitle.Position = UDim2.new(0, 0, 0.5, -100)
    mainTitle.BackgroundTransparency = 1
    mainTitle.Text = "SHADOWRAZE"
    mainTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    mainTitle.TextSize = 48
    mainTitle.Font = Enum.Font.GothamBold
    mainTitle.TextStrokeColor3 = Color3.fromRGB(80, 60, 180)
    mainTitle.TextStrokeTransparency = 0.3
    mainTitle.Parent = logoFrame
    
    local subtitle = Instance.new("TextLabel")
    subtitle.Name = "Subtitle"
    subtitle.Size = UDim2.new(1, 0, 0, 30)
    subtitle.Position = UDim2.new(0, 0, 0.5, -50)
    subtitle.BackgroundTransparency = 1
    subtitle.Text = "DA HOOD"
    subtitle.TextColor3 = Color3.fromRGB(150, 140, 200)
    subtitle.TextSize = 24
    subtitle.Font = Enum.Font.Gotham
    subtitle.Parent = logoFrame
    
    -- Прогресс-бар
    local progressBg = Instance.new("Frame")
    progressBg.Name = "ProgressBg"
    progressBg.Size = UDim2.new(0, 250, 0, 6)
    progressBg.Position = UDim2.new(0.5, -125, 0.5, 10)
    progressBg.BackgroundColor3 = Color3.fromRGB(30, 30, 50)
    progressBg.BackgroundTransparency = 0.5
    progressBg.BorderSizePixel = 1
    progressBg.BorderColor3 = Color3.fromRGB(60, 50, 100)
    progressBg.Parent = logoFrame
    
    local progressCorner = Instance.new("UICorner")
    progressCorner.CornerRadius = UDim.new(0, 4)
    progressCorner.Parent = progressBg
    
    local progressFill = Instance.new("Frame")
    progressFill.Name = "ProgressFill"
    progressFill.Size = UDim2.new(0, 0, 1, 0)
    progressFill.BackgroundColor3 = Color3.fromRGB(130, 100, 255)
    progressFill.BorderSizePixel = 0
    progressFill.Parent = progressBg
    
    local progressFillCorner = Instance.new("UICorner")
    progressFillCorner.CornerRadius = UDim.new(0, 4)
    progressFillCorner.Parent = progressFill
    
    local progGradient = Instance.new("UIGradient")
    progGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(100, 70, 255)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(160, 100, 255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(100, 70, 255)),
    })
    progGradient.Parent = progressFill
    
    local progressText = Instance.new("TextLabel")
    progressText.Name = "ProgressText"
    progressText.Size = UDim2.new(0, 80, 0, 20)
    progressText.Position = UDim2.new(0.5, -40, 0.5, 20)
    progressText.BackgroundTransparency = 1
    progressText.Text = "0%"
    progressText.TextColor3 = Color3.fromRGB(180, 170, 220)
    progressText.TextSize = 14
    progressText.Font = Enum.Font.Gotham
    progressText.Parent = logoFrame
    
    local loadingText = Instance.new("TextLabel")
    loadingText.Name = "LoadingText"
    loadingText.Size = UDim2.new(1, 0, 0, 20)
    loadingText.Position = UDim2.new(0, 0, 0.5, 40)
    loadingText.BackgroundTransparency = 1
    loadingText.Text = "LOADING..."
    loadingText.TextColor3 = Color3.fromRGB(120, 110, 170)
    loadingText.TextSize = 16
    loadingText.Font = Enum.Font.Gotham
    loadingText.Parent = logoFrame
    
    -- Анимации
    local TweenService = game:GetService("TweenService")
    
    -- Появление фона
    local bgTween = TweenService:Create(background, TweenInfo.new(1.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        BackgroundTransparency = 0.15
    })
    bgTween:Play()
    
    -- Появление логотипа
    logoFrame.Scale = 0.3
    local logoInTween = TweenService:Create(logoFrame, TweenInfo.new(0.8, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Scale = 1
    })
    logoInTween:Play()
    
    -- Текст появляется с задержкой
    mainTitle.TextTransparency = 1
    subtitle.TextTransparency = 1
    
    task.delay(0.3, function()
        local titleTween = TweenService:Create(mainTitle, TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            TextTransparency = 0
        })
        titleTween:Play()
    end)
    
    task.delay(0.6, function()
        local subTween = TweenService:Create(subtitle, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            TextTransparency = 0
        })
        subTween:Play()
    end)
    
    -- Симуляция загрузки
    local progress = 0
    local dotCount = 0
    
    local function UpdateLoadingDots()
        dotCount = (dotCount % 3) + 1
        loadingText.Text = "LOADING" .. string.rep(".", dotCount)
    end
    
    -- Быстрая загрузка до 80%
    while progress < 80 do
        task.wait(0.02)
        progress = progress + math.random(3, 8)
        if progress > 80 then progress = 80 end
        progressFill.Size = UDim2.new(progress / 100, 0, 1, 0)
        progressText.Text = math.floor(progress) .. "%"
        UpdateLoadingDots()
    end
    
    -- Медленная до 95%
    while progress < 95 do
        task.wait(0.05)
        progress = progress + math.random(1, 3)
        if progress > 95 then progress = 95 end
        progressFill.Size = UDim2.new(progress / 100, 0, 1, 0)
        progressText.Text = math.floor(progress) .. "%"
        UpdateLoadingDots()
    end
    
    -- Финальное исчезновение
    task.delay(0.1, function()
        local finalTween = TweenService:Create(progressFill, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            Size = UDim2.new(1, 0, 1, 0)
        })
        finalTween:Play()
        
        for i = 96, 100 do
            progressText.Text = i .. "%"
            task.wait(0.025)
        end
        progressText.Text = "100% ✓"
        progressText.TextColor3 = Color3.fromRGB(100, 255, 150)
        
        -- Вспышка
        local flash = Instance.new("Frame")
        flash.Size = UDim2.new(1, 0, 1, 0)
        flash.BackgroundColor3 = Color3.fromRGB(130, 100, 255)
        flash.BackgroundTransparency = 1
        flash.BorderSizePixel = 0
        flash.Parent = gui
        
        local flashTween = TweenService:Create(flash, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            BackgroundTransparency = 0.4
        })
        flashTween:Play()
        
        task.wait(0.15)
        
        local flashOut = TweenService:Create(flash, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
            BackgroundTransparency = 1
        })
        flashOut:Play()
        
        task.wait(0.2)
        
        local fadeOut = TweenService:Create(gui, TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
            ImageTransparency = 1
        })
        fadeOut:Play()
        
        task.wait(0.6)
        gui:Destroy()
    end)
    
    -- Аварийное закрытие через 8 секунд
    task.delay(8, function()
        if gui and gui.Parent then
            gui:Destroy()
        end
    end)
end

-- Запускаем интро
task.spawn(ShowShadowrazeIntro)

-- ===========================================================
--  ОСНОВНОЙ СКРИПТ SHADOWRAZE (ваш код)
-- ===========================================================

-- [[ ВСТАВЬТЕ СЮДА ВЕСЬ ВАШ ОСНОВНОЙ КОД SHADOWRAZE ]]
-- [[ (тот самый длинный код, который вы мне скинули) ]]

-- ===========================================================
--  КОНЕЦ СКРИПТА
-- ===========================================================
