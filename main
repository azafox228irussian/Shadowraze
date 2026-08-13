-- ===========================================================
--  SHADOWRAZE LOGO INTRO (с анимацией)
-- ===========================================================

local function ShowShadowrazeIntro()
    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer
    local RunService = game:GetService("RunService")
    
    -- Проверяем, не показывали ли уже
    if getgenv()._ShadowrazeIntroShown then return end
    getgenv()._ShadowrazeIntroShown = true
    
    -- Ждём загрузки GUI
    repeat task.wait() until game:IsLoaded()
    
    -- Создаём ScreenGui
    local gui = Instance.new("ScreenGui")
    gui.Name = "ShadowrazeIntro"
    gui.IgnoreGuiInset = true
    gui.ZIndexBehavior = Enum.ZIndexBehavior.Global
    gui.Parent = game:GetService("CoreGui")
    
    -- Фоновый затемнённый слой
    local background = Instance.new("Frame")
    background.Name = "Background"
    background.Size = UDim2.new(1, 0, 1, 0)
    background.BackgroundColor3 = Color3.fromRGB(8, 8, 16)
    background.BackgroundTransparency = 1
    background.BorderSizePixel = 0
    background.Parent = gui
    
    -- Градиент на фоне
    local gradient = Instance.new("UIGradient")
    gradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(8, 8, 16)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(16, 10, 30)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(8, 8, 16)),
    })
    gradient.Rotation = 45
    gradient.Parent = background
    
    -- ГЛАВНЫЙ ЛОГОТИП (изображение)
    local logoFrame = Instance.new("Frame")
    logoFrame.Name = "LogoFrame"
    logoFrame.Size = UDim2.new(0, 300, 0, 300)
    logoFrame.Position = UDim2.new(0.5, -150, 0.5, -200)
    logoFrame.BackgroundTransparency = 1
    logoFrame.Parent = gui
    
    -- Уголок для красоты
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 20)
    corner.Parent = logoFrame
    
    -- Градиентный фон логотипа
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
    
    -- Обводка логотипа
    local logoStroke = Instance.new("UIStroke")
    logoStroke.Color = Color3.fromRGB(100, 80, 200)
    logoStroke.Thickness = 2
    logoStroke.Transparency = 0.5
    logoStroke.Parent = logoFrame
    
    -- Текст "SHADOWRAZE"
    local mainTitle = Instance.new("TextLabel")
    mainTitle.Name = "MainTitle"
    mainTitle.Size = UDim2.new(1, 0, 0, 60)
    mainTitle.Position = UDim2.new(0, 0, 0.5, -100)
    mainTitle.BackgroundTransparency = 1
    mainTitle.Text = "SHADOWRAZE"
    mainTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    mainTitle.TextSize = 48
    mainTitle.Font = Enum.Font.GothamBold
    mainTitle.TextScaled = false
    mainTitle.TextStrokeColor3 = Color3.fromRGB(80, 60, 180)
    mainTitle.TextStrokeTransparency = 0.3
    mainTitle.Parent = logoFrame
    
    -- Подзаголовок
    local subtitle = Instance.new("TextLabel")
    subtitle.Name = "Subtitle"
    subtitle.Size = UDim2.new(1, 0, 0, 30)
    subtitle.Position = UDim2.new(0, 0, 0.5, -50)
    subtitle.BackgroundTransparency = 1
    subtitle.Text = "DA HOOD"
    subtitle.TextColor3 = Color3.fromRGB(150, 140, 200)
    subtitle.TextSize = 24
    subtitle.Font = Enum.Font.Gotham
    subtitle.TextScaled = false
    subtitle.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    subtitle.TextStrokeTransparency = 0.5
    subtitle.Parent = logoFrame
    
    -- Строка загрузки (Progress Bar)
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
    
    -- Заполнение прогресс-бара
    local progressFill = Instance.new("Frame")
    progressFill.Name = "ProgressFill"
    progressFill.Size = UDim2.new(0, 0, 1, 0)
    progressFill.BackgroundColor3 = Color3.fromRGB(130, 100, 255)
    progressFill.BorderSizePixel = 0
    progressFill.Parent = progressBg
    
    local progressFillCorner = Instance.new("UICorner")
    progressFillCorner.CornerRadius = UDim.new(0, 4)
    progressFillCorner.Parent = progressFill
    
    -- Градиент на прогресс-баре
    local progGradient = Instance.new("UIGradient")
    progGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(100, 70, 255)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(160, 100, 255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(100, 70, 255)),
    })
    progGradient.Parent = progressFill
    
    -- Процент загрузки
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
    
    -- Текст "LOADING..." мигающий
    local loadingText = Instance.new("TextLabel")
    loadingText.Name = "LoadingText"
    loadingText.Size = UDim2.new(1, 0, 0, 20)
    loadingText.Position = UDim2.new(0, 0, 0.5, 40)
    loadingText.BackgroundTransparency = 1
    loadingText.Text = "LOADING..."
    loadingText.TextColor3 = Color3.fromRGB(120, 110, 170)
    loadingText.TextSize = 16
    loadingText.Font = Enum.Font.Gotham
    loadingText.TextScaled = false
    loadingText.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    loadingText.TextStrokeTransparency = 0.5
    loadingText.Parent = logoFrame
    
    -- ===== АНИМАЦИИ =====
    local TweenService = game:GetService("TweenService")
    
    -- 1. Появление фона (затемнение)
    background:TweenPosition(UDim2.new(1, 0, 0, 0), "In", "Quad", 0.1, true)
    local bgTween = TweenService:Create(background, TweenInfo.new(1.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        BackgroundTransparency = 0.15
    })
    bgTween:Play()
    
    -- 2. Появление логотипа (увеличение + вращение)
    logoFrame.Scale = 0.3
    local logoInTween = TweenService:Create(logoFrame, TweenInfo.new(0.8, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Scale = 1
    })
    logoInTween:Play()
    
    -- 3. Появление текста (поэтапно)
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
    
    -- 4. Пульсация прогресс-бара
    local pulseTween = TweenService:Create(progressFill, TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
        BackgroundTransparency = 0.2
    })
    pulseTween:Play()
    
    -- 5. Мигание LOADING...
    local dotCount = 0
    local function UpdateLoadingDots()
        dotCount = (dotCount % 3) + 1
        loadingText.Text = "LOADING" .. string.rep(".", dotCount)
    end
    
    -- 6. СИМУЛЯЦИЯ ЗАГРУЗКИ
    local progress = 0
    local speed = 2.5 -- секунды на всю загрузку
    
    -- Сначала быстрая загрузка до 80%
    while progress < 80 do
        task.wait(0.02)
        progress = progress + math.random(3, 8)
        if progress > 80 then progress = 80 end
        
        progressFill.Size = UDim2.new(progress / 100, 0, 1, 0)
        progressText.Text = math.floor(progress) .. "%"
        UpdateLoadingDots()
    end
    
    -- Потом медленная до 95%
    while progress < 95 do
        task.wait(0.05)
        progress = progress + math.random(1, 3)
        if progress > 95 then progress = 95 end
        
        progressFill.Size = UDim2.new(progress / 100, 0, 1, 0)
        progressText.Text = math.floor(progress) .. "%"
        UpdateLoadingDots()
    end
    
    -- 7. ФИНАЛ: плавное исчезновение
    task.delay(0.1, function()
        -- Заполняем до 100%
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
        
        -- Эффект "вспышки" в конце
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
        
        -- 8. Исчезновение GUI
        task.wait(0.2)
        
        local fadeOut = TweenService:Create(gui, TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
            ImageTransparency = 1
        })
        fadeOut:Play()
        
        task.wait(0.6)
        gui:Destroy()
        
        -- Уведомление о загрузке
        if Notification then
            Notification.new({
                Title = "Shadowraze",
                Content = "Successfully loaded!",
                Duration = 3,
            })
        end
    end)
    
    -- Обработка ошибок (аварийное закрытие через 5 секунд)
    task.delay(8, function()
        if gui and gui.Parent then
            gui:Destroy()
        end
    end)
end

-- Запускаем интро
task.spawn(ShowShadowrazeIntro)
