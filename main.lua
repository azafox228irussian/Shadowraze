-- ===========================================================
--  SHADOWRAZE PREMIUM INTRO (минималистичное)
-- ===========================================================

local function ShowShadowrazeIntro()
    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer
    local TweenService = game:GetService("TweenService")
    local RunService = game:GetService("RunService")

    if getgenv()._ShadowrazeIntroShown then return end
    getgenv()._ShadowrazeIntroShown = true

    repeat task.wait() until game:IsLoaded()

    -- ===== GUI =====
    local gui = Instance.new("ScreenGui")
    gui.Name = "ShadowrazeIntro"
    gui.IgnoreGuiInset = true
    gui.ZIndexBehavior = Enum.ZIndexBehavior.Global
    gui.Parent = game:GetService("CoreGui")

    -- ===== ФОН =====
    local bg = Instance.new("Frame")
    bg.Size = UDim2.new(1, 0, 1, 0)
    bg.BackgroundColor3 = Color3.fromRGB(6, 6, 12)
    bg.BackgroundTransparency = 1
    bg.BorderSizePixel = 0
    bg.Parent = gui

    -- Тонкий градиент
    local grad = Instance.new("UIGradient")
    grad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(6, 6, 12)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(14, 10, 28)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(6, 6, 12)),
    })
    grad.Rotation = 30
    grad.Parent = bg

    -- ===== ОСНОВНОЙ КОНТЕЙНЕР =====
    local container = Instance.new("Frame")
    container.Size = UDim2.new(0, 420, 0, 280)
    container.Position = UDim2.new(0.5, -210, 0.5, -140)
    container.BackgroundTransparency = 1
    container.Parent = gui
    container.Visible = false

    -- ===== ЛОГОТИП (стилизованная буква S) =====
    local logo = Instance.new("Frame")
    logo.Size = UDim2.new(0, 80, 0, 80)
    logo.Position = UDim2.new(0.5, -40, 0, 0)
    logo.BackgroundColor3 = Color3.fromRGB(130, 100, 255)
    logo.BackgroundTransparency = 1
    logo.BorderSizePixel = 0
    logo.Parent = container

    -- Скругление
    local logoCorner = Instance.new("UICorner")
    logoCorner.CornerRadius = UDim.new(0, 16)
    logoCorner.Parent = logo

    -- Тонкая обводка
    local logoStroke = Instance.new("UIStroke")
    logoStroke.Color = Color3.fromRGB(130, 100, 255)
    logoStroke.Thickness = 1.5
    logoStroke.Transparency = 0.6
    logoStroke.Parent = logo

    -- Текст "S" внутри логотипа
    local logoSymbol = Instance.new("TextLabel")
    logoSymbol.Size = UDim2.new(1, 0, 1, 0)
    logoSymbol.BackgroundTransparency = 1
    logoSymbol.Text = "S"
    logoSymbol.TextColor3 = Color3.fromRGB(255, 255, 255)
    logoSymbol.TextSize = 44
    logoSymbol.Font = Enum.Font.GothamBold
    logoSymbol.TextScaled = false
    logoSymbol.Parent = logo

    -- ===== ЗАГОЛОВОК =====
    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, 0, 0, 50)
    title.Position = UDim2.new(0, 0, 0, 95)
    title.BackgroundTransparency = 1
    title.Text = "SHADOWRAZE"
    title.TextColor3 = Color3.fromRGB(255, 255, 255)
    title.TextSize = 38
    title.Font = Enum.Font.GothamBold
    title.TextStrokeColor3 = Color3.fromRGB(80, 60, 180)
    title.TextStrokeTransparency = 0.4
    title.Parent = container

    -- ===== ПОДЗАГОЛОВОК =====
    local subtitle = Instance.new("TextLabel")
    subtitle.Size = UDim2.new(1, 0, 0, 24)
    subtitle.Position = UDim2.new(0, 0, 0, 145)
    subtitle.BackgroundTransparency = 1
    subtitle.Text = "DA HOOD"
    subtitle.TextColor3 = Color3.fromRGB(150, 140, 210)
    subtitle.TextSize = 18
    subtitle.Font = Enum.Font.Gotham
    subtitle.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    subtitle.TextStrokeTransparency = 0.5
    subtitle.Parent = container

    -- ===== ПРОГРЕСС-БАР (ТОНКИЙ) =====
    local barBg = Instance.new("Frame")
    barBg.Size = UDim2.new(0, 280, 0, 2)
    barBg.Position = UDim2.new(0.5, -140, 0, 200)
    barBg.BackgroundColor3 = Color3.fromRGB(30, 28, 50)
    barBg.BackgroundTransparency = 0.3
    barBg.BorderSizePixel = 0
    barBg.Parent = container

    local barFill = Instance.new("Frame")
    barFill.Size = UDim2.new(0, 0, 1, 0)
    barFill.BackgroundColor3 = Color3.fromRGB(130, 100, 255)
    barFill.BorderSizePixel = 0
    barFill.Parent = barBg

    -- Градиент на баре
    local barGrad = Instance.new("UIGradient")
    barGrad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(100, 70, 255)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(160, 100, 255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(100, 70, 255)),
    })
    barGrad.Parent = barFill

    -- ===== ПРОЦЕНТЫ =====
    local pctText = Instance.new("TextLabel")
    pctText.Size = UDim2.new(1, 0, 0, 20)
    pctText.Position = UDim2.new(0, 0, 0, 215)
    pctText.BackgroundTransparency = 1
    pctText.Text = ""
    pctText.TextColor3 = Color3.fromRGB(180, 175, 220)
    pctText.TextSize = 13
    pctText.Font = Enum.Font.Gotham
    pctText.Parent = container

    -- ===== СТАТУС =====
    local status = Instance.new("TextLabel")
    status.Size = UDim2.new(1, 0, 0, 18)
    status.Position = UDim2.new(0, 0, 0, 245)
    status.BackgroundTransparency = 1
    status.Text = ""
    status.TextColor3 = Color3.fromRGB(120, 115, 180)
    status.TextSize = 12
    status.Font = Enum.Font.Gotham
    status.Parent = container

    -- ===== АНИМАЦИИ =====

    -- 1. Появление фона (плавное затемнение)
    local bgIn = TweenService:Create(bg, TweenInfo.new(1.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        BackgroundTransparency = 0.08
    })
    bgIn:Play()

    -- 2. Контейнер появляется
    container.Visible = true
    container.BackgroundTransparency = 1
    local containerIn = TweenService:Create(container, TweenInfo.new(1.0, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        BackgroundTransparency = 0
    })
    containerIn:Play()

    -- 3. Логотип: вращение + появление
    logo.BackgroundTransparency = 1
    logo.Rotation = -15
    logo.Scale = 0.3

    local logoIn = TweenService:Create(logo, TweenInfo.new(0.9, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        BackgroundTransparency = 0.15,
        Rotation = 0,
        Scale = 1
    })
    logoIn:Play()

    -- 4. Символ "S" появляется позже
    logoSymbol.TextTransparency = 1
    task.delay(0.25, function()
        local symIn = TweenService:Create(logoSymbol, TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            TextTransparency = 0
        })
        symIn:Play()
    end)

    -- 5. Заголовок
    title.TextTransparency = 1
    task.delay(0.5, function()
        local titleIn = TweenService:Create(title, TweenInfo.new(0.7, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            TextTransparency = 0
        })
        titleIn:Play()
    end)

    -- 6. Подзаголовок
    subtitle.TextTransparency = 1
    task.delay(0.8, function()
        local subIn = TweenService:Create(subtitle, TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            TextTransparency = 0
        })
        subIn:Play()
    end)

    -- 7. Прогресс-бар (появляется)
    barBg.BackgroundTransparency = 0.3
    task.delay(0.3, function()
        local barIn = TweenService:Create(barBg, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            BackgroundTransparency = 0
        })
        barIn:Play()
    end)

    -- ===== СИМУЛЯЦИЯ ЗАГРУЗКИ =====
    local progress = 0
    local phases = {
        { target = 25, speed = 5, text = "Initializing..." },
        { target = 50, speed = 4, text = "Loading modules..." },
        { target = 75, speed = 3, text = "Preparing environment..." },
        { target = 92, speed = 2, text = "Finalizing..." },
        { target = 100, speed = 1, text = "Ready!" },
    }

    local phaseIndex = 1
    local currentPhase = phases[phaseIndex]
    local pctDisplay = 0

    while progress < 100 do
        task.wait(0.02)
        progress = progress + currentPhase.speed
        if progress > currentPhase.target then
            progress = currentPhase.target
        end

        pctDisplay = pctDisplay + (progress - pctDisplay) * 0.15
        barFill.Size = UDim2.new(pctDisplay / 100, 0, 1, 0)
        pctText.Text = math.floor(pctDisplay) .. "%"

        if progress >= currentPhase.target and phaseIndex < #phases then
            phaseIndex = phaseIndex + 1
            currentPhase = phases[phaseIndex]
            status.Text = currentPhase.text

            -- Плавная смена статуса
            status.TextTransparency = 0
            local fadeIn = TweenService:Create(status, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                TextTransparency = 0
            })
            fadeIn:Play()
        end
    end

    -- 100% — финальный акцент
    pctText.Text = "100%"
    pctText.TextColor3 = Color3.fromRGB(100, 255, 150)
    status.Text = "✓ Ready"

    -- Микро-вспышка
    local flash = Instance.new("Frame")
    flash.Size = UDim2.new(1, 0, 1, 0)
    flash.BackgroundColor3 = Color3.fromRGB(130, 100, 255)
    flash.BackgroundTransparency = 1
    flash.BorderSizePixel = 0
    flash.Parent = gui

    local flashIn = TweenService:Create(flash, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        BackgroundTransparency = 0.3
    })
    flashIn:Play()
    task.wait(0.15)
    local flashOut = TweenService:Create(flash, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
        BackgroundTransparency = 1
    })
    flashOut:Play()

    -- ===== ИСЧЕЗНОВЕНИЕ =====
    task.wait(0.4)

    local fadeOut = TweenService:Create(gui, TweenInfo.new(0.7, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
        ImageTransparency = 1
    })
    fadeOut:Play()
    task.wait(0.7)
    gui:Destroy()

    -- Уведомление
    if Notification then
        pcall(function()
            Notification.new({
                Title = "Shadowraze",
                Content = "Ready to dominate!",
                Duration = 2,
            })
        end)
    end

    -- Аварийное закрытие (безопасность)
    task.delay(10, function()
        if gui and gui.Parent then
            gui:Destroy()
        end
    end)
end

task.spawn(ShowShadowrazeIntro)
