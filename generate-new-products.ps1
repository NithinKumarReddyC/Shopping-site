Add-Type -AssemblyName System.Drawing

function Make-Gif {
    param(
        [string]$Path, [string]$Line1, [string]$Line2, [string]$Emoji,
        [System.Drawing.Color]$C1, [System.Drawing.Color]$C2
    )
    $w=400; $h=280
    $bmp = New-Object System.Drawing.Bitmap $w, $h
    $g   = [System.Drawing.Graphics]::FromImage($bmp)
    $g.SmoothingMode   = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias
    $g.TextRenderingHint = [System.Drawing.Text.TextRenderingHint]::AntiAliasGridFit
    $rect = New-Object System.Drawing.Rectangle 0,0,$w,$h
    $br   = New-Object System.Drawing.Drawing2D.LinearGradientBrush $rect,$C1,$C2,45.0
    $g.FillRectangle($br,$rect); $br.Dispose()
    # icon circle
    $ib = New-Object System.Drawing.SolidBrush ([System.Drawing.Color]::FromArgb(45,255,255,255))
    $g.FillEllipse($ib,135,20,130,130); $ib.Dispose()
    # emoji
    $ef  = New-Object System.Drawing.Font("Segoe UI Emoji",[float]52,[System.Drawing.FontStyle]::Regular)
    $wb  = New-Object System.Drawing.SolidBrush ([System.Drawing.Color]::White)
    $sf  = New-Object System.Drawing.StringFormat
    $sf.Alignment=$sf.LineAlignment=[System.Drawing.StringAlignment]::Center
    $g.DrawString($Emoji,$ef,$wb,200,85,$sf); $ef.Dispose()
    # divider
    $pen = New-Object System.Drawing.Pen ([System.Drawing.Color]::FromArgb(60,255,255,255)),1
    $g.DrawLine($pen,55,185,345,185); $pen.Dispose()
    # line1
    $f1 = New-Object System.Drawing.Font("Segoe UI",[float]14,[System.Drawing.FontStyle]::Bold)
    $r1 = New-Object System.Drawing.RectangleF 10,190,380,42
    $g.DrawString($Line1,$f1,$wb,$r1,$sf); $f1.Dispose()
    # line2
    $f2  = New-Object System.Drawing.Font("Segoe UI",[float]10,[System.Drawing.FontStyle]::Regular)
    $sb  = New-Object System.Drawing.SolidBrush ([System.Drawing.Color]::FromArgb(220,255,255,255))
    $g.DrawString($Line2,$f2,$sb,200,247,$sf)
    $f2.Dispose(); $sb.Dispose(); $sf.Dispose(); $wb.Dispose()
    $bmp.Save($Path,[System.Drawing.Imaging.ImageFormat]::Gif)
    $g.Dispose(); $bmp.Dispose()
    Write-Output "OK: $Path"
}

function C([int]$r,[int]$g,[int]$b){ [System.Drawing.Color]::FromArgb($r,$g,$b) }

$d = "Shopping-site\src\main\webapp\images"

# Sports
Make-Gif "$d\badminton-racket.svg" "Yonex Badminton Racket" "Astrox 88D Pro" "🏸" (C 29 78 216) (C 59 130 246)
Make-Gif "$d\football.svg"         "Nivia Storm Football"   "Size 5 • AIFF Approved" "⚽" (C 22 101 52) (C 34 197 94)
Make-Gif "$d\cricket-kit.svg"      "Cosco Cricket Kit"      "Youth Full Kit" "🏏" (C 180 83 9) (C 217 119 6)
Make-Gif "$d\gym-gloves.svg"       "Boldfit Gym Gloves"     "Wrist Support" "🧤" (C 127 29 29) (C 185 28 28)
Make-Gif "$d\dumbbell.svg"         "Decathlon Dumbbell Set" "20 kg Adjustable" "🏋️" (C 30 64 175) (C 37 99 235)
Make-Gif "$d\tennis-racket.svg"    "Nivia Tennis Racket"    "27 inch Aluminium" "🎾" (C 101 163 13) (C 132 204 22)
Make-Gif "$d\football-boots.svg"   "Adidas Predator 23"     "Football Boots" "👟" (C 220 38 38) (C 239 68 68)

# Beauty
Make-Gif "$d\lipstick.svg"         "Lakme 9to5 Lipstick"   "Red Coat Matte" "💄" (C 190 18 60) (C 225 29 72)
Make-Gif "$d\face-scrub.svg"       "Neutrogena Scrub"      "Deep Clean 100g" "✨" (C 2 132 199) (C 14 165 233)
Make-Gif "$d\hair-oil.svg"         "Mamaearth Onion Oil"   "Hair Fall Control" "🧴" (C 101 74 56) (C 160 110 70)
Make-Gif "$d\razor.svg"            "Gillette Mach3 Turbo"  "Triple Blade Razor" "🪒" (C 30 64 175) (C 59 130 246)
Make-Gif "$d\face-wash.svg"        "Biotique Face Wash"    "200 ml Natural" "🌿" (C 21 128 61) (C 22 163 74)
Make-Gif "$d\sunscreen.svg"        "Plum Sunscreen SPF50"  "No White Cast" "☀️" (C 161 98 7) (C 202 138 4)
Make-Gif "$d\sugar-lipstick.svg"   "SUGAR Matte Lipstick"  "Berry Me Shade" "💋" (C 88 28 135) (C 126 34 206)

# Toys
Make-Gif "$d\lego.svg"             "LEGO Classic Bricks"   "790 Pieces • Ages 4+" "🧱" (C 220 38 38) (C 239 68 68)
Make-Gif "$d\hot-wheels.svg"       "Hot Wheels Garage"     "3-Floor Playset" "🚗" (C 180 83 9) (C 234 88 12)
Make-Gif "$d\monopoly.svg"         "Monopoly Classic"      "Board Game 2-6 Players" "🎲" (C 21 128 61) (C 22 163 74)
Make-Gif "$d\rubiks-cube.svg"      "Rubik Cube 3x3"        "Competition Grade" "🧩" (C 29 78 216) (C 59 130 246)
Make-Gif "$d\rc-car.svg"           "RC Off-Road Buggy"     "25 kmph • 4WD" "🚙" (C 127 29 29) (C 185 28 28)
Make-Gif "$d\nerf-gun.svg"         "Nerf Disruptor"        "27m Range • 6 Darts" "🔫" (C 161 98 7) (C 202 138 4)

# Kitchen
Make-Gif "$d\pressure-cooker.svg"  "Prestige Pressure Cooker" "5 Litre Aluminium" "🍲" (C 71 85 105) (C 100 116 139)
Make-Gif "$d\thermos-flask.svg"    "Milton Thermosteel"    "1 L • Hot 24 hr" "☕" (C 30 64 175) (C 59 130 246)
Make-Gif "$d\glass-set.svg"        "Borosil Vision Glass"  "305 ml Set of 6" "🥤" (C 2 132 199) (C 14 165 233)
Make-Gif "$d\gas-stove.svg"        "Pigeon 2-Burner Stove" "Glass Top • ISI Mark" "🔥" (C 220 38 38) (C 239 68 68)
Make-Gif "$d\rice-cooker.svg"      "Prestige Rice Cooker"  "1.8 L Auto Cook" "🍚" (C 21 128 61) (C 22 163 74)
Make-Gif "$d\frying-pan.svg"       "Hawkins Non-Stick Pan" "26 cm Hard Anodised" "🍳" (C 71 85 105) (C 100 116 139)
Make-Gif "$d\casserole-set.svg"    "Cello Casserole Set"   "4 Pcs Borosilicate" "🥘" (C 88 28 135) (C 126 34 206)

# Health
Make-Gif "$d\bp-monitor.svg"       "Omron BP Monitor"      "Automatic Upper Arm" "❤️" (C 220 38 38) (C 239 68 68)
Make-Gif "$d\glucometer.svg"       "Accu-Chek Active"      "Blood Glucose Meter" "💉" (C 2 132 199) (C 14 165 233)
Make-Gif "$d\nebulizer.svg"        "Morepen Nebulizer"     "Compressor Type NB-50" "😷" (C 30 64 175) (C 59 130 246)
Make-Gif "$d\fish-oil.svg"         "HK Vitals Fish Oil"    "60 Capsules 1000mg" "💊" (C 21 128 61) (C 22 163 74)
Make-Gif "$d\oximeter.svg"         "Dr. Morepen Oximeter"  "Fingertip SpO2 & PR" "🩺" (C 180 83 9) (C 217 119 6)

# Stationery
Make-Gif "$d\ballpen.svg"          "Parker Beta Ball Pen"  "Pack of 20 • Blue" "🖊️" (C 29 78 216) (C 59 130 246)
Make-Gif "$d\notebook.svg"         "Classmate Notebook"    "Pack of 6 • 192 Pages" "📓" (C 101 163 13) (C 132 204 22)
Make-Gif "$d\stapler.svg"          "Kangaro Stapler HD-10" "Jam-Free Mechanism" "📎" (C 220 38 38) (C 239 68 68)
Make-Gif "$d\art-kit.svg"          "Camlin Kokuyo Art Kit" "60 Piece Complete Set" "🎨" (C 88 28 135) (C 126 34 206)
Make-Gif "$d\colour-pencils.svg"   "Faber-Castell Pencils" "36 Colours Set" "✏️" (C 161 98 7) (C 202 138 4)

# Pets
Make-Gif "$d\dog-food.svg"         "Pedigree Dog Food"     "3 kg Chicken & Veg" "🐶" (C 180 83 9) (C 217 119 6)
Make-Gif "$d\cat-food.svg"         "Whiskas Cat Food"      "1.2 kg Tuna Flavour" "🐱" (C 88 28 135) (C 126 34 206)
Make-Gif "$d\pet-bowls.svg"        "PetSafe Pet Bowls"     "Set of 2 Stainless" "🍽️" (C 71 85 105) (C 100 116 139)

# Travel
Make-Gif "$d\trolley-bag.svg"      "Skybags Trooper 55"    "Cabin Trolley 42L" "🧳" (C 2 132 199) (C 14 165 233)
Make-Gif "$d\rucksack.svg"         "Wildcraft Rucksack"    "55 L Trekking Bag" "🎒" (C 21 128 61) (C 22 163 74)
Make-Gif "$d\safari-bag.svg"       "Safari TRIO 65 cm"     "Hard Shell Trolley" "🧳" (C 220 38 38) (C 239 68 68)

# Automotive
Make-Gif "$d\car-charger.svg"      "Bosch Battery Charger" "12V 6A Auto Charge" "🔋" (C 30 64 175) (C 59 130 246)
Make-Gif "$d\car-cloth.svg"        "3M Microfiber Cloth"   "Pack of 3 • 380 GSM" "🚗" (C 71 85 105) (C 100 116 139)
Make-Gif "$d\tyre-inflator.svg"    "Michelin Tyre Inflator" "LCD • 100 PSI Max" "🏎️" (C 220 38 38) (C 239 68 68)

# Music
Make-Gif "$d\acoustic-guitar.svg"  "Fender CD-60S Guitar"  "Acoustic • Natural" "🎸" (C 180 83 9) (C 217 119 6)
Make-Gif "$d\keyboard.svg"         "Casio SA-78 Keyboard"  "44 Keys • 100 Tones" "🎹" (C 30 64 175) (C 59 130 246)
Make-Gif "$d\recorder-flute.svg"   "Yamaha FS100A Recorder" "Soprano • Blue ABS" "🎵" (C 2 132 199) (C 14 165 233)

Write-Output "All 50 images generated!"
