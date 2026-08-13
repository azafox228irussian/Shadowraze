-- ===========================================================
--  SHADOWRAZE — ЗАГРУЗЧИК С ИНТРО
--  Сначала показывается интро, потом загружается основной скрипт
-- ===========================================================

local function ShowIntroAndLoad()
    -- Проверяем, не запущено ли уже
    if getgenv()._ShadowrazeLoading then return end
    getgenv()._ShadowrazeLoading = true
    
    -- Ждём загрузки игры
    repeat task.wait() until game:IsLoaded()
    
    -- ==========================================
    --  ЧАСТЬ 1: ИНТРО
    -- ==========================================
    
    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer
    local TweenService = game:GetService("TweenService")
    
    -- Создаём GUI
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
    
    -- Градиент фона
    local gradient = Instance.new("UIGradient")
    gradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(8, 8, 16)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(16, 10, 30)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(8, 8, 16)),
    })
    gradient.Rotation = 45
    gradient.Parent = background
    
    -- Контейнер логотипа
    local logoFrame = Instance.new("Frame")
    logoFrame.Name = "LogoFrame"
    logoFrame.Size = UDim2.new(0, 300, 0, 300)
    logoFrame.Position = UDim2.new(0.5, -150, 0.5, -200)
    logoFrame.BackgroundTransparency = 1
    logoFrame.Parent = gui
    
    -- Фон логотипа
    local logoBg = Instance.new("Frame")
    logoBg.Size = UDim2.new(1, 0, 1, 0)
    logoBg.BackgroundColor3 = Color3.fromRGB(30, 25, 50)
    logoBg.BackgroundTransparency = 0.3
    logoBg.BorderSizePixel = 0
    logoBg.Parent = logoFrame
    
    local logoBgCorner = Instance.new("UICorner")
    logoBgCorner.CornerRadius = UDim.new(0, 20)
    logoBgCorner.Parent = logoBg
    
    -- Обводка
    local logoStroke = Instance.new("UIStroke")
    logoStroke.Color = Color3.fromRGB(100, 80, 200)
    logoStroke.Thickness = 2
    logoStroke.Transparency = 0.5
    logoStroke.Parent = logoFrame
    
    -- Заголовок
    local mainTitle = Instance.new("TextLabel")
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
    
    -- Подзаголовок
    local subtitle = Instance.new("TextLabel")
    subtitle.Size = UDim2.new(1, 0, 0, 30)
    subtitle.Position = UDim2.new(0, 0, 0.5, -50)
    subtitle.BackgroundTransparency = 1
    subtitle.Text = "DA HOOD"
    subtitle.TextColor3 = Color3.fromRGB(150, 140, 200)
    subtitle.TextSize = 24
    subtitle.Font = Enum.Font.Gotham
    subtitle.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    subtitle.TextStrokeTransparency = 0.5
    subtitle.Parent = logoFrame
    
    -- Прогресс-бар
    local progressBg = Instance.new("Frame")
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
    progressFill.Size = UDim2.new(0, 0, 1, 0)
    progressFill.BackgroundColor3 = Color3.fromRGB(130, 100, 255)
    progressFill.BorderSizePixel = 0
    progressFill.Parent = progressBg
    
    local progressFillCorner = Instance.new("UICorner")
    progressFillCorner.CornerRadius = UDim.new(0, 4)
    progressFillCorner.Parent = progressFill
    
    -- Градиент прогресса
    local progGradient = Instance.new("UIGradient")
    progGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(100, 70, 255)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(160, 100, 255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(100, 70, 255)),
    })
    progGradient.Parent = progressFill
    
    -- Текст процентов
    local progressText = Instance.new("TextLabel")
    progressText.Size = UDim2.new(0, 80, 0, 20)
    progressText.Position = UDim2.new(0.5, -40, 0.5, 20)
    progressText.BackgroundTransparency = 1
    progressText.Text = "0%"
    progressText.TextColor3 = Color3.fromRGB(180, 170, 220)
    progressText.TextSize = 14
    progressText.Font = Enum.Font.Gotham
    progressText.Parent = logoFrame
    
    -- Текст LOADING
    local loadingText = Instance.new("TextLabel")
    loadingText.Size = UDim2.new(1, 0, 0, 20)
    loadingText.Position = UDim2.new(0, 0, 0.5, 40)
    loadingText.BackgroundTransparency = 1
    loadingText.Text = "LOADING..."
    loadingText.TextColor3 = Color3.fromRGB(120, 110, 170)
    loadingText.TextSize = 16
    loadingText.Font = Enum.Font.Gotham
    loadingText.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    loadingText.TextStrokeTransparency = 0.5
    loadingText.Parent = logoFrame
    
    -- ==========================================
    --  АНИМАЦИИ ИНТРО
    -- ==========================================
    
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
    
    -- Появление текста
    mainTitle.TextTransparency = 1
    subtitle.TextTransparency = 1
    
    task.delay(0.3, function()
        TweenService:Create(mainTitle, TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            TextTransparency = 0
        }):Play()
    end)
    
    task.delay(0.6, function()
        TweenService:Create(subtitle, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            TextTransparency = 0
        }):Play()
    end)
    
    -- Мигание LOADING
    local dotCount = 0
    local function UpdateLoadingDots()
        dotCount = (dotCount % 3) + 1
        loadingText.Text = "LOADING" .. string.rep(".", dotCount)
    end
    
    -- ==========================================
    --  СИМУЛЯЦИЯ ЗАГРУЗКИ (интро)
    -- ==========================================
    
    local progress = 0
    
    -- Быстрая до 80%
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
    
    -- ФИНАЛ ИНТРО
    task.delay(0.1, function()
        -- Дозаполняем до 100%
        TweenService:Create(progressFill, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            Size = UDim2.new(1, 0, 1, 0)
        }):Play()
        
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
        
        TweenService:Create(flash, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            BackgroundTransparency = 0.4
        }):Play()
        
        task.wait(0.15)
        
        TweenService:Create(flash, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
            BackgroundTransparency = 1
        }):Play()
        
        task.wait(0.2)
        
        -- Исчезновение интро
        TweenService:Create(gui, TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
            ImageTransparency = 1
        }):Play()
        
        task.wait(0.6)
        gui:Destroy()
        
        -- ==========================================
        --  ЧАСТЬ 2: ЗАГРУЗКА ОСНОВНОГО СКРИПТА
        -- ==========================================
        
        -- Загружаем основной скрипт Shadowraze
        -- (ваш основной код с Combat, Visuals, Movement и т.д.)
        -- ВАЖНО: Вместо этого загрузите ваш полный скрипт
        
        print("Shadowraze: Интро завершено, загружаем основной скрипт...")
        
        -- Здесь должен быть ваш основной код
        -- Например, если вы вынесли его в отдельный файл:
        -- loadstring(game:HttpGet("https://raw.githubusercontent.com/azafox228irussian/Shadowraze/main/core.lua"))()
        
        -- ИЛИ если весь код в одном файле, то он просто продолжит выполняться
        
        -- Уведомление
        if Notification then
            pcall(function()
                Notification.new({
                    Title = "Shadowraze",
                    Content = "Successfully loaded!",
                    Duration = 3,
                })
            end)
        end
    end)
end

-- Запускаем загрузчик
task.spawn(ShowIntroAndLoad)
