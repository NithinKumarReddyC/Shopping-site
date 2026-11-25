Add-Type -AssemblyName System.Drawing

function Make-Gif {
    param([string]$Path, [string]$Line1, [string]$Line2, [string]$Emoji,
          [System.Drawing.Color]$C1, [System.Drawing.Color]$C2)
    $w=400; $h=280
    $bmp = New-Object System.Drawing.Bitmap $w, $h
    $g   = [System.Drawing.Graphics]::FromImage($bmp)
    $g.SmoothingMode   = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias
    $g.TextRenderingHint = [System.Drawing.Text.TextRenderingHint]::AntiAliasGridFit
    $rect = New-Object System.Drawing.Rectangle 0,0,$w,$h
    $br   = New-Object System.Drawing.Drawing2D.LinearGradientBrush $rect,$C1,$C2,45.0
    $g.FillRectangle($br,$rect); $br.Dispose()
    $ib = New-Object System.Drawing.SolidBrush ([System.Drawing.Color]::FromArgb(45,255,255,255))
    $g.FillEllipse($ib,135,20,130,130); $ib.Dispose()
    $ef  = New-Object System.Drawing.Font("Segoe UI Emoji",[float]52,[System.Drawing.FontStyle]::Regular)
    $wb  = New-Object System.Drawing.SolidBrush ([System.Drawing.Color]::White)
    $sf  = New-Object System.Drawing.StringFormat
    $sf.Alignment=$sf.LineAlignment=[System.Drawing.StringAlignment]::Center
    $g.DrawString($Emoji,$ef,$wb,200,85,$sf); $ef.Dispose()
    $pen = New-Object System.Drawing.Pen ([System.Drawing.Color]::FromArgb(60,255,255,255)),1
    $g.DrawLine($pen,55,185,345,185); $pen.Dispose()
    $f1 = New-Object System.Drawing.Font("Segoe UI",[float]13,[System.Drawing.FontStyle]::Bold)
    $r1 = New-Object System.Drawing.RectangleF 10,190,380,42
    $g.DrawString($Line1,$f1,$wb,$r1,$sf); $f1.Dispose()
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
# Apple product images - all use Apple's signature dark/silver style
Make-Gif "$d\apple-iphone15promax.svg"  "iPhone 15 Pro Max"      "A17 Pro • 48MP • Titanium"     "📱" (C 15 23 42)   (C 30 64 175)
Make-Gif "$d\apple-macbook-pro14.svg"   "MacBook Pro 14-inch M3" "M3 Pro • 18 GB • 22hr Battery" "💻" (C 15 23 42)   (C 51 65 85)
Make-Gif "$d\apple-ipad-pro.svg"        "iPad Pro 12.9-inch M2"  "Liquid Retina XDR • 120Hz"     "📱" (C 30 64 175)  (C 59 130 246)
Make-Gif "$d\apple-ipad-air.svg"        "iPad Air 11-inch M2"    "M2 Chip • 128 GB • USB-C"      "📲" (C 2 132 199)  (C 14 165 233)
Make-Gif "$d\apple-watch-s10.svg"       "Apple Watch Series 10"  "Thinnest Watch • ECG • 36hr"   "⌚" (C 15 23 42)   (C 30 64 175)
Make-Gif "$d\apple-watch-ultra2.svg"    "Apple Watch Ultra 2"    "72hr Battery • Action Button"  "⌚" (C 71 85 105)  (C 148 163 184)
Make-Gif "$d\apple-mac-mini.svg"        "Mac Mini M4"            "Smallest Mac • Thunderbolt 4"  "🖥️" (C 71 85 105)  (C 148 163 184)
Make-Gif "$d\apple-imac.svg"            "iMac 24-inch M4"        "4.5K Retina • 16GB • Blue"     "🖥️" (C 29 78 216)  (C 59 130 246)
Make-Gif "$d\apple-airpods-max.svg"     "AirPods Max USB-C"      "ANC • Lossless • 20hr"         "🎧" (C 15 23 42)   (C 51 65 85)
Make-Gif "$d\apple-homepod.svg"         "HomePod 2nd Gen"        "Spatial Audio • Siri"          "🔊" (C 15 23 42)   (C 30 64 175)
Make-Gif "$d\apple-tv.svg"              "Apple TV 4K 3rd Gen"    "A15 Bionic • Dolby Vision"     "📺" (C 15 23 42)   (C 51 65 85)
Make-Gif "$d\apple-pencil-pro.svg"      "Apple Pencil Pro"       "Squeeze • Hover • Find My"     "✏️" (C 71 85 105)  (C 148 163 184)
Make-Gif "$d\apple-magsafe-battery.svg" "MagSafe Battery Pack"   "5000 mAh • 7.5W Wireless"     "🔋" (C 30 64 175)  (C 59 130 246)
Write-Output "All 13 Apple product images done!"
