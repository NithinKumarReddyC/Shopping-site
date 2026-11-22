Add-Type -AssemblyName System.Drawing

function Create-GroceryGif {
    param(
        [string]$Path,
        [string]$Title,
        [string]$Subtitle,
        [string]$Emoji,
        [System.Drawing.Color]$BgColor1,
        [System.Drawing.Color]$BgColor2
    )

    $width = 400
    $height = 280
    $bmp = New-Object System.Drawing.Bitmap $width, $height
    $g = [System.Drawing.Graphics]::FromImage($bmp)
    $g.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias
    $g.TextRenderingHint = [System.Drawing.Text.TextRenderingHint]::AntiAliasGridFit

    # Background gradient
    $rect = New-Object System.Drawing.Rectangle 0, 0, $width, $height
    $brush = New-Object System.Drawing.Drawing2D.LinearGradientBrush $rect, $BgColor1, $BgColor2, 45.0
    $g.FillRectangle($brush, $rect)
    $brush.Dispose()

    # Circle background for icon
    $circleBrush = New-Object System.Drawing.SolidBrush ([System.Drawing.Color]::FromArgb(40, 255, 255, 255))
    $g.FillEllipse($circleBrush, 130, 25, 140, 140)
    $circleBrush.Dispose()

    # Inner decorative circle
    $innerCircleBrush = New-Object System.Drawing.SolidBrush ([System.Drawing.Color]::FromArgb(25, 255, 255, 255))
    $g.FillEllipse($innerCircleBrush, 150, 45, 100, 100)
    $innerCircleBrush.Dispose()

    $whiteBrush = New-Object System.Drawing.SolidBrush ([System.Drawing.Color]::White)
    $sf = New-Object System.Drawing.StringFormat
    $sf.Alignment = [System.Drawing.StringAlignment]::Center
    $sf.LineAlignment = [System.Drawing.StringAlignment]::Center

    # Emoji / Icon text
    $emojiFont = New-Object System.Drawing.Font("Segoe UI Emoji", [float]48, [System.Drawing.FontStyle]::Regular)
    $g.DrawString($Emoji, $emojiFont, $whiteBrush, 200, 95, $sf)
    $emojiFont.Dispose()

    # Dividing line
    $pen = New-Object System.Drawing.Pen ([System.Drawing.Color]::FromArgb(60, 255, 255, 255)), 1
    $g.DrawLine($pen, 60, 185, 340, 185)
    $pen.Dispose()

    # Title
    $titleFont = New-Object System.Drawing.Font("Segoe UI", [float]15, [System.Drawing.FontStyle]::Bold)
    $g.DrawString($Title, $titleFont, $whiteBrush, 200, 210, $sf)
    $titleFont.Dispose()

    # Subtitle
    $subFont = New-Object System.Drawing.Font("Segoe UI", [float]10, [System.Drawing.FontStyle]::Regular)
    $subBrush = New-Object System.Drawing.SolidBrush ([System.Drawing.Color]::FromArgb(220, 255, 255, 255))
    $g.DrawString($Subtitle, $subFont, $subBrush, 200, 245, $sf)
    $subBrush.Dispose()
    $subFont.Dispose()

    $sf.Dispose()
    $whiteBrush.Dispose()

    # Save as GIF
    $bmp.Save($Path, [System.Drawing.Imaging.ImageFormat]::Gif)
    $g.Dispose()
    $bmp.Dispose()
    Write-Output "Successfully generated: $Path"
}

$dir = "Shopping-site\src\main\webapp\images"
Create-GroceryGif "$dir\rice.gif" "Basmati Rice (5 kg)" "Aged Fragrant Long Grain • 100% Pure" "🍚" ([System.Drawing.Color]::FromArgb(21, 128, 61)) ([System.Drawing.Color]::FromArgb(22, 163, 74))
Create-GroceryGif "$dir\milk.gif" "Fresh Whole Milk (1 L)" "Full Cream 6% Fat • Homogenised" "🥛" ([System.Drawing.Color]::FromArgb(3, 105, 161)) ([System.Drawing.Color]::FromArgb(14, 165, 233))
Create-GroceryGif "$dir\eggs.gif" "Brown Eggs (Pack of 12)" "Farm Fresh • High Protein • Graded" "🥚" ([System.Drawing.Color]::FromArgb(180, 83, 9)) ([System.Drawing.Color]::FromArgb(217, 119, 6))
Create-GroceryGif "$dir\bread.gif" "Whole Wheat Bread (400g)" "100% Atta • Zero Maida • Freshly Baked" "🍞" ([System.Drawing.Color]::FromArgb(185, 28, 28)) ([System.Drawing.Color]::FromArgb(225, 29, 72))
Create-GroceryGif "$dir\sunflower-oil.gif" "Sunflower Oil (1 L)" "Refined Cooking Oil • Vitamin A & D" "🌻" ([System.Drawing.Color]::FromArgb(161, 98, 7)) ([System.Drawing.Color]::FromArgb(202, 138, 4))
Create-GroceryGif "$dir\atta.gif" "Sharbati Atta (10 kg)" "100% Whole Wheat • Superior MP Grain" "🌾" ([System.Drawing.Color]::FromArgb(101, 74, 56)) ([System.Drawing.Color]::FromArgb(160, 110, 70))
Create-GroceryGif "$dir\tea.gif" "Premium Tea (500g)" "Gold Care • Tulsi, Ginger & Cardamom" "☕" ([System.Drawing.Color]::FromArgb(67, 56, 202)) ([System.Drawing.Color]::FromArgb(99, 102, 241))
Create-GroceryGif "$dir\chocolate.gif" "Dairy Milk Silk (150g)" "Smooth & Creamy Milk Chocolate" "🍫" ([System.Drawing.Color]::FromArgb(88, 28, 135)) ([System.Drawing.Color]::FromArgb(126, 34, 206))
