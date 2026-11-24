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

function Get-HexColor {
    param([string]$Hex)
    $hex = $Hex.TrimStart('#')
    return [System.Drawing.Color]::FromArgb(
        [Convert]::ToInt32($hex.Substring(0, 2), 16),
        [Convert]::ToInt32($hex.Substring(2, 2), 16),
        [Convert]::ToInt32($hex.Substring(4, 2), 16))
}

# Vector "product photo" card in the same visual language as the existing SVGs.
function Create-ProductSvg {
    param(
        [string]$Path,
        [string]$Title,
        [string]$Subtitle,
        [string]$Emoji,
        [string]$Color1,
        [string]$Color2
    )

    $svg = @"
<svg xmlns="http://www.w3.org/2000/svg" width="600" height="420" viewBox="0 0 600 420">
  <defs>
    <linearGradient id="bg" x1="0%" y1="0%" x2="100%" y2="100%">
      <stop offset="0%" stop-color="$Color1"/>
      <stop offset="100%" stop-color="$Color2"/>
    </linearGradient>
  </defs>
  <rect width="600" height="420" fill="url(#bg)"/>
  <circle cx="300" cy="170" r="100" fill="rgba(255,255,255,0.10)"/>
  <circle cx="300" cy="170" r="65" fill="rgba(255,255,255,0.07)"/>
  <text x="300" y="195" text-anchor="middle" font-size="80">$Emoji</text>
  <line x1="150" y1="295" x2="450" y2="295" stroke="rgba(255,255,255,0.18)" stroke-width="1"/>
  <text x="300" y="335" text-anchor="middle" font-size="22" fill="white" font-family="Segoe UI,Arial,sans-serif" font-weight="bold">$Title</text>
  <text x="300" y="370" text-anchor="middle" font-size="13" fill="rgba(255,255,255,0.75)" font-family="Segoe UI,Arial,sans-serif">$Subtitle</text>
</svg>
"@
    [System.IO.File]::WriteAllText($Path, $svg, (New-Object System.Text.UTF8Encoding $false))
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

# ── Expanding the catalog — new grocery items (GIF) ──
Create-GroceryGif "$dir\coffee.gif" "Nescafe Classic (100 g)" "100% Pure Instant Coffee • Rich & Smooth" "☕" ([System.Drawing.Color]::FromArgb(69, 26, 3)) ([System.Drawing.Color]::FromArgb(146, 64, 14))
Create-GroceryGif "$dir\biscuits.gif" "Britannia Good Day (Pack of 6)" "Cashew & Butter Cookies • Crunchy" "🍪" ([System.Drawing.Color]::FromArgb(154, 52, 18)) ([System.Drawing.Color]::FromArgb(234, 88, 12))
Create-GroceryGif "$dir\paneer.gif" "Heritage Paneer (200 g)" "Fresh Cottage Cheese • High Protein" "🧀" ([System.Drawing.Color]::FromArgb(241, 245, 249)) ([System.Drawing.Color]::FromArgb(191, 219, 254))
Create-GroceryGif "$dir\yogurt.gif" "Epigamia Greek Yogurt (400 g)" "Thick & Creamy • Live Cultures" "🥣" ([System.Drawing.Color]::FromArgb(251, 207, 232)) ([System.Drawing.Color]::FromArgb(244, 114, 182))
Create-GroceryGif "$dir\honey.gif" "Dabur Honey (500 g)" "Pure & Natural • World's No.1 Honey" "🍯" ([System.Drawing.Color]::FromArgb(180, 83, 9)) ([System.Drawing.Color]::FromArgb(250, 204, 21))
Create-GroceryGif "$dir\ghee.gif" "Amul Pure Ghee (500 ml)" "Made from Fresh Cream • Rich Aroma" "🧈" ([System.Drawing.Color]::FromArgb(161, 98, 7)) ([System.Drawing.Color]::FromArgb(253, 230, 138))

# Dark text for the pale GIF cards above (re-render those three with dark text)
function Create-GroceryGifDarkText {
    param(
        [string]$Path, [string]$Title, [string]$Subtitle, [string]$Emoji,
        [System.Drawing.Color]$BgColor1, [System.Drawing.Color]$BgColor2
    )
    $width = 400; $height = 280
    $bmp = New-Object System.Drawing.Bitmap $width, $height
    $g = [System.Drawing.Graphics]::FromImage($bmp)
    $g.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias
    $g.TextRenderingHint = [System.Drawing.Text.TextRenderingHint]::AntiAliasGridFit
    $rect = New-Object System.Drawing.Rectangle 0, 0, $width, $height
    $brush = New-Object System.Drawing.Drawing2D.LinearGradientBrush $rect, $BgColor1, $BgColor2, 45.0
    $g.FillRectangle($brush, $rect); $brush.Dispose()
    $circleBrush = New-Object System.Drawing.SolidBrush ([System.Drawing.Color]::FromArgb(50, 255, 255, 255))
    $g.FillEllipse($circleBrush, 130, 25, 140, 140); $circleBrush.Dispose()
    $innerCircleBrush = New-Object System.Drawing.SolidBrush ([System.Drawing.Color]::FromArgb(35, 255, 255, 255))
    $g.FillEllipse($innerCircleBrush, 150, 45, 100, 100); $innerCircleBrush.Dispose()
    $inkBrush = New-Object System.Drawing.SolidBrush ([System.Drawing.Color]::FromArgb(30, 41, 59))
    $sf = New-Object System.Drawing.StringFormat
    $sf.Alignment = [System.Drawing.StringAlignment]::Center; $sf.LineAlignment = [System.Drawing.StringAlignment]::Center
    $emojiFont = New-Object System.Drawing.Font("Segoe UI Emoji", [float]48, [System.Drawing.FontStyle]::Regular)
    $g.DrawString($Emoji, $emojiFont, $inkBrush, 200, 95, $sf); $emojiFont.Dispose()
    $pen = New-Object System.Drawing.Pen ([System.Drawing.Color]::FromArgb(60, 30, 41, 59)), 1
    $g.DrawLine($pen, 60, 185, 340, 185); $pen.Dispose()
    $titleFont = New-Object System.Drawing.Font("Segoe UI", [float]15, [System.Drawing.FontStyle]::Bold)
    $g.DrawString($Title, $titleFont, $inkBrush, 200, 210, $sf); $titleFont.Dispose()
    $subFont = New-Object System.Drawing.Font("Segoe UI", [float]10, [System.Drawing.FontStyle]::Regular)
    $subBrush = New-Object System.Drawing.SolidBrush ([System.Drawing.Color]::FromArgb(200, 30, 41, 59))
    $g.DrawString($Subtitle, $subFont, $subBrush, 200, 245, $sf); $subBrush.Dispose(); $subFont.Dispose()
    $sf.Dispose(); $inkBrush.Dispose()
    $bmp.Save($Path, [System.Drawing.Imaging.ImageFormat]::Gif); $g.Dispose(); $bmp.Dispose()
    Write-Output "Successfully generated: $Path"
}
Create-GroceryGifDarkText "$dir\paneer.gif" "Heritage Paneer (200 g)" "Fresh Cottage Cheese • High Protein" "🧀" ([System.Drawing.Color]::FromArgb(248, 250, 252)) ([System.Drawing.Color]::FromArgb(191, 219, 254))
Create-GroceryGifDarkText "$dir\yogurt.gif" "Epigamia Greek Yogurt (400g)" "Thick & Creamy • Live Cultures" "🥣" ([System.Drawing.Color]::FromArgb(253, 242, 248)) ([System.Drawing.Color]::FromArgb(244, 114, 182))
Create-GroceryGifDarkText "$dir\honey.gif" "Dabur Honey (500 g)" "Pure & Natural • No Added Sugar" "🍯" ([System.Drawing.Color]::FromArgb(254, 249, 195)) ([System.Drawing.Color]::FromArgb(250, 204, 21))

# ── Expanding the catalog — new product SVGs ──
Create-ProductSvg "$dir\samsung-s23-fe.svg" "Galaxy S23 FE 5G" "128 GB  •  Exynos 2200  •  50 MP • A18" "📱" "#0f766e" "#14b8a6"
Create-ProductSvg "$dir\realme-gt-6.svg" "Realme GT 6 5G" "256 GB  •  Snapdragon 8s Gen 3 • 120W" "📱" "#ca8a04" "#eab308"
Create-ProductSvg "$dir\redmi-note-13.svg" "Redmi Note 13 Pro+" "256 GB  •  200 MP  •  120W HyperCharge" "📱" "#be123c" "#f43f5e"
Create-ProductSvg "$dir\dell-inspiron.svg" "Dell Inspiron 14 Laptop" "Core i7  •  16 GB RAM  •  512 GB SSD" "💻" "#1e40af" "#3b82f6"
Create-ProductSvg "$dir\thinkpad-e14.svg" "Lenovo ThinkPad E14" "Core i5  •  16 GB  •  Business Laptop" "💻" "#111827" "#374151"
Create-ProductSvg "$dir\ipad-air.svg" "iPad Air M2 11-inch" "M2 chip  •  256 GB  •  Wi-Fi 6E" "📲" "#475569" "#94a3b8"
Create-ProductSvg "$dir\jbl-speaker.svg" "JBL Flip 6 Speaker" "Portable  •  IP67 Waterproof  •  12H" "🔊" "#9a3412" "#f97316"
Create-ProductSvg "$dir\canon-camera.svg" "Canon EOS R50 (18–45mm)" "24.2 MP  •  4K Video  •  Kit Lens" "📷" "#0f172a" "#334155"
Create-ProductSvg "$dir\ps5-console.svg" "PlayStation 5 Slim" "1 TB  •  Ray Tracing  •  DualSense" "🎮" "#1e3a8a" "#2563eb"
Create-ProductSvg "$dir\adidas-ultraboost.svg" "Adidas Ultraboost Light" "Running  •  BOOST cushioning  •  Primeknit" "👟" "#0f172a" "#475569"
Create-ProductSvg "$dir\hm-dress.svg" "H&M Floral A-Line Dress" "Viscose  •  Casual  •  Flared hem" "👗" "#be185d" "#ec4899"
Create-ProductSvg "$dir\fastrack-watch.svg" "Fastrack Analog Watch" "Stainless steel  •  5 ATM  •  Quartz" "⌚" "#78350f" "#b45309"
Create-ProductSvg "$dir\rayban-sunglasses.svg" "Ray-Ban Wayfarer Classic" "Polarised  •  UV400  •  Acetate frame" "🕶️" "#0c4a6e" "#0284c7"
Create-ProductSvg "$dir\wooden-bookshelf.svg" "5-Tier Engineered Wood Bookshelf" "5 shelves  •  Oak finish  •  Easy install" "📚" "#57534e" "#a8a29e"
Create-ProductSvg "$dir\dining-set.svg" "6-Seater Solid Wood Dining Set" "6 chairs  •  Solid sheesham wood  •  Table" "🍽️" "#7c2d12" "#c2410c"
Create-ProductSvg "$dir\dyson-vacuum.svg" "Dyson V8 Absolute Vacuum" "Cordless  •  HEPA filtration  •  40 min" "🧹" "#4c1d95" "#8b5cf6"
Create-ProductSvg "$dir\fan-gift.svg" "Warm Gift Card" "Instant delivery  •  Any amount • ShopKart" "🎁" "#7f1d1d" "#dc2626"
