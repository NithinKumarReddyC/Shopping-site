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
    $f1 = New-Object System.Drawing.Font("Segoe UI",[float]14,[System.Drawing.FontStyle]::Bold)
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
Make-Gif "$d\gopro-hero12.svg"   "GoPro HERO12 Black"      "5.3K • 60m Waterproof" "📷" (C 30 64 175)  (C 59 130 246)
Make-Gif "$d\dji-drone.svg"      "DJI Mini 4 Pro"          "4K HDR • 34 Min Flight" "🚁" (C 15 23 42)   (C 30 64 175)
Make-Gif "$d\echo-dot.svg"       "Amazon Echo Dot 5th Gen" "Alexa • Smart Speaker" "🔊" (C 2 132 199)   (C 14 165 233)
Make-Gif "$d\logitech-mouse.svg" "Logitech MX Master 3S"   "8000 DPI Wireless Mouse" "🖱️" (C 71 85 105) (C 100 116 139)
Make-Gif "$d\lenovo-gaming.svg"  "Lenovo IdeaPad Gaming 3" "RTX 3050 • 16 GB RAM" "🎮" (C 220 38 38)   (C 239 68 68)
Make-Gif "$d\ps5-slim.svg"       "PlayStation 5 Slim"      "4K • 120fps Gaming" "🕹️" (C 29 78 216)     (C 59 130 246)
Make-Gif "$d\airpods-pro.svg"    "Apple AirPods Pro 2"     "ANC • H2 Chip • USB-C" "🎧" (C 71 85 105)  (C 148 163 184)
Make-Gif "$d\kindle.svg"         "Kindle Paperwhite 16 GB" "300 PPI • 10 Wk Battery" "📚" (C 15 23 42)  (C 30 58 138)
Make-Gif "$d\powerbank.svg"      "Anker 737 Power Bank"    "24000 mAh • 140W PD" "🔋" (C 21 128 61)    (C 22 163 74)
Make-Gif "$d\projector.svg"      "Zebronics Projector"     "1080p • 200 ANSI Lumens" "📽️" (C 88 28 135) (C 126 34 206)
Write-Output "All 10 gadget images done!"
